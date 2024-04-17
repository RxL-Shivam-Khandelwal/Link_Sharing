<g:if test="${!topic_Show_MapP.topic_posts.empty }">
    <g:each in="${topic_Show_MapP.topic_posts}" var="posts">
        <div class="card1">
            <div class="image">
                <img src="https://louisville.edu/enrollmentmanagement/images/person-icon/image" alt="p1">
            </div>
            <div class="content ">
                <div class="poster_info mrgn">
                    <span class="name_id">${posts?.user?.firstName} | ${posts?.user?.email}</span>
                    <span class="topic"> ${posts?.topic?.name}</span>
                </div>

                <div class="post_content mrgn">${posts.description}
                </div>
                <div class="poster_info ">
                    <div class="clogo">
                        <img src="${assetPath(src: 'facebook.svg')}" alt="facebook">
                        <img src="${assetPath(src: 'twitter.svg')}" alt="twitter">
                        <img src="${assetPath(src: 'instagram.svg')}" alt="instagram">
                    </div>
                    <a href="#">Delete</a>
                    <a href="#">Edit</a>
                    <a href="#">Download</a>
                    <a href="#">View full site</a>
                </div>
            </div>

        </div>
    </g:each>
</g:if>
<g:else>
    <p> No posts  </p>
</g:else>


${"value of page is;" + currentPageP}
${"value of the total record is " + totalRecords_Posts }
<div class="pagination">
    <g:if test="${totalRecords_Posts > maxPerPageP * currentPageP}">
        <a href="javascript:void(0);" onclick="loadNextPageP()">Next</a>
    </g:if>

</div>

<script>
    function loadNextPageP() {
        let currentPage = parseInt('${currentPageP}');
        console.log(${currentPageP});
        console.log("current page is ", currentPage);
        let nextPage = currentPage + 1;
        let topicId= parseInt('${ topic_Show_MapP.curr_topic.id}');
        console.log("value of the topicId is :", topicId);
        let url = '${createLink(controller: "Topic_show", action: "nextPageResources")}?page=' + nextPage+ '&topicId=' +topicId;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'html',
            success: function(response) {
                console.log(${currentPageP});
                $('#23topicPosts').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Error loading next page:', status, error);
            }
        });
    }
</script>