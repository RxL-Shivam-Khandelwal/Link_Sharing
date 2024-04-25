package first_grails

import grails.gorm.transactions.Transactional
import first_grails.Subscription;
import first_grails.Topic;
import org.hibernate.criterion.Projections

@Transactional
class RegisterService {

    def serviceMethod() {

    }

    def dashboard(Long userId) {
        Users user = Users.findById(userId)
        Users curr_user = user;
        def subscriptionCount = Subscription.createCriteria().get {
            projections {
                count()
            }
            createAlias('topic', 't')
            eq('user.id', userId)
            eq('t.isdeleted', false)
        }
        def topicCount = Topic.createCriteria().get {
            projections {
                count()
            }
            eq('user.id', userId)
            eq('isdeleted', false)
        }

//        List<Subscription> sub_topic = Subscription.findAllByUser(user);
        List<Subscription> sub_topic = Subscription.createCriteria().list{
            eq("user" , user)
        }
        List<Topic> topics = Topic.list();
        topics.sort({ t1, t2 ->
            Long ResourcecountT1 = t1.resources.size();
            Long ResourcecountT2 = t2.resources.size();
            (ResourcecountT2 <=> ResourcecountT1)
        })
        def all = allPosts(topics, user);
        List<Resources> l = all[0];
        Long totalRecordsP = all[1];
        String user_img = curr_user.photoURL;
        println topics.size();
        // preparing data for pagination.
        Long totalRecords = topics.size();
        Long maxPerPage = 2
        Long maxPerPageP = 3
        Long currentPage = 1;
        Long offset = (currentPage - 1) * maxPerPage;
        topics = Topic.createCriteria().list(max: maxPerPage, offset: offset) {
            eq('isdeleted', false);

        }

        List<Resources> paginatedSubscriptions = PaginatePosts(l, offset, maxPerPageP);

        Map mp = [
                subscriptionCount     : subscriptionCount,
                topicCount            : topicCount,
                topics                : topics,
                l                     : l,
                sub_topic             : sub_topic,
                user                  : user,
                user_img              : user_img,
                maxPerPage            : maxPerPage,
                currentPage           : currentPage,
                offset                : offset,
                totalRecords          : totalRecords,
                paginatedSubscriptions: paginatedSubscriptions,
                totalRecordsP         : totalRecordsP,
                maxPerPageP  :           maxPerPageP
        ]
        return mp;
    }

    List<Resources> PaginatePosts(List<Resources> l, Long offset, Long maxPerPage) {
        List<Resources> paginatedSubscriptions;

        int endIndex = Math.min(offset + maxPerPage, l.size());

        if (offset < l.size()) {
            paginatedSubscriptions = l.subList(Math.toIntExact(offset), Math.toIntExact(endIndex));
        } else {
            paginatedSubscriptions = Collections.emptyList();
        }
        return paginatedSubscriptions;
    }

    List<Resources> allPosts(List<Topic> topics, Users user) {
        List<Resources> l = []
        List<Resources> new_posts = [];
        Long totalRecordsP = 0;
        topics.each { it ->
            if (Subscription.findByTopicAndUser(it, user) && it.resources.size() && it.visibility == Topic.Visibility.Public) {
                def reso = it.resources;
                reso.each { it1 ->
                    new_posts.add([it1]);
                }
            }
        }
        new_posts.each { resource ->
            List<ReadingItem> readingItemlist = ReadingItem.findAllByResource(resource);
            Boolean flag = 0;
            readingItemlist.each { it ->
                if (it.user == user && it.isRead) {
                    flag = 1;
                }
            }
            if (!flag) {
                l.add([resource]);
                totalRecordsP++;
            }
        }

        l = l.flatten();
        return [l, totalRecordsP];
    }

    def nextPage(Long currentPage, Long totalRecords, Users curr_user) {
        def maxPerPage = 2
        def offset = (currentPage - 1) * maxPerPage
        def topics = Topic.createCriteria().list(max: maxPerPage, offset: offset) {
            eq('isdeleted', false);
        }
        Map mp = [
                topics      : topics,
                currentPage : currentPage,
                totalRecords: totalRecords,
                maxPerPage  : maxPerPage,
                curr_user   : curr_user
        ]
        return mp;
    }

    def nextPageP(def params, Users user) {

        Long maxPerPage = 3
        Long currentPage = 1;
        if (params?.page) {
            currentPage = params.page.toLong();
        }
        println "value of current page is :" + currentPage;
        Long offset = (currentPage - 1) * maxPerPage
        List<Topic> topics = Topic.list();
        def all = allPosts(topics, user);
        List<Resources> l = all[0];
        Long totalRecordsP = all[1];
        List<Resources> paginatedSubscriptions = PaginatePosts(l, offset, maxPerPage);
          Map mp = [
                  paginatedSubscriptions:paginatedSubscriptions,totalRecordsP:totalRecordsP,maxPerPage:maxPerPage,currentPage:currentPage
          ]
        return mp;
    }

}
