<g:if test="${resourceP != null && !resourceP.empty}">
    <g:each in="${resourceP}"  var ="res">
        <g:if test="${!res.isdeleted}">
            <div class="card1 ">
                <div class="image">
                    <img src="https://louisville.edu/enrollmentmanagement/images/person-icon/image" alt="p1">
                </div>
                <div class="content">
                    <div class="poster_info">
                        <%
                            def currentTime = new Date()
                        %>

                        <span class="name_id">${res?.user?.username} |  ${res?.user?.email} | ${(new Date().time - res.lastUpdated.time) / 60000} minutes</span>
                        <span class="topic"> ${res?.topic?.name}</span>
                    </div>
                    <div class="post_content">Description : ${res.description}
                    </div>
                    <div class="poster_info setting_margin">
                        <div class="clogo">
                            <img src="${assetPath(src: 'facebook.svg')}" alt="facebook">
                            <img src="${assetPath(src: 'twitter.svg')}" alt="twitter">
                            <img src="${assetPath(src: 'instagram.svg')}" alt="instagram">
                        </div>
                        <span class="topic">
                            <g:link controller="Post" action="show" params="[resId: res.id]">View post</g:link>
                        </span>
                    </div>
                </div>

            </div>
        </g:if>
    </g:each>
</g:if>
<div class="pagination">
    <g:if test="${totalRecordsP > maxPerPageP * currentPageP}">
        <a href="javascript:void(0);" onclick="loadNextPageP()">Next</a>
    </g:if>

</div>

<script>
    function loadNextPageP() {
        let currentPage = parseInt('${currentPageP}');
        console.log(${currentPageP});
        console.log("current page is ", currentPage);
        let nextPage = currentPage + 1;
        let url = '${createLink(controller: "Login", action: "topPosts")}?page=' + nextPage;
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'html',
            success: function(response) {
                console.log(${currentPageP});
                $('#top_Posts').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Error loading next page:', status, error);
            }
        });
    }
</script>