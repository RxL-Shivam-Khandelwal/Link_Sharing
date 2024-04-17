<%@ page import="first_grails.Subscription" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${assetPath(src: 'Login.css')}" type="text/css">
    <link rel="stylesheet" href="${assetPath(src: 'topic_show.css')}" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<style>
    .lft_half{
        padding-left: 11px
    }
</style>
<body>
    <div class="navbar" style="justify-content: space-evenly;">
        <div>
            <a href="#" class="nav-link">
                <h3>Link Sharing</h3>
            </a>
        </div>
        <div class="search-container">
            <span class="search-icon">&#128269;</span>
            <input type="text" class="search-input" placeholder="Search...">
            <span class="close-icon">&#10005;</span>
        </div>
        <div class="clogo">
           <div class="logo-container" onmouseover="changeColor(this)"> <img src="${assetPath(src: 'chat-fill.svg')}" alt="chat-fill" onclick="showCard(1)"></div>
         <div class="logo-container" onmouseover="changeColor(this)">   <img src="${assetPath(src: 'envelope.svg')}" alt="envelope" onclick="showCard(2)">  </div>
          <div class="logo-container" onmouseover="changeColor(this)">  <img src="${assetPath(src: 'link.svg')}" alt="link" onclick="showCard(3)">  </div>
          <div class="logo-container" onmouseover="changeColor(this)">  <img src="${assetPath(src: 'file-earmark-fill.svg')}" alt="file-earmark-fill" onclick="showCard(4)">  </div>
        </div>
        <div class="dprofile">
            <img src="${assetPath(src: 'person-fill.svg')}" alt="person-fill" style="height: 30px; width: 30px; padding-top: 6px;">  
            <div class="dropdown">
                <button class="dropbtn nbtn">Dropdown
                    <img src="/Img/caret-down-fill.svg" alt="">
                </button>
<div class="dropdown-content">
    <g:link controller="Profile">Profile</g:link>
    <g:link controller="user">User</g:link>
    <g:link controller="topic">Topic</g:link>
    <g:link controller="post">Post</g:link>
    <g:link controller="Logout">Logout</g:link>
</div>

            </div>
        </div>
    </div>
    <div class="window">
        <g:if test="session?.user">
        <div class="modal fade" id="exampleModalLinkRes" tabindex="-1" role="dialog" aria-labelledby="exampleModalLinkR" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLinkR">New message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <g:form controller="LinkResource" action="UpdateLink">
                        <g:hiddenField name="userId" value="${session.userId}"/>
                        <g:hiddenField name="res_id" id="res_id" value=""/>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">url* :</label>
                                <input type="text" class="form-control" id="recipient-name" name="url">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Description:</label>
                                <textarea class="form-control" id="message-text" name=description></textarea>
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Topic:</label>
                                <input type="text" class="form-control" id="topic_name" name="topic" readonly>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button class="btn btn-primary" type="submit">Send message</button>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
        </g:if>
        <div class="leftside">
                <div class="topics">
                    <div class="Recent_share">
                        <h5>Recent Share</h5>
                    </div>
                    <div class="card1">
                        <div class="image">
                            <img src="https://louisville.edu/enrollmentmanagement/images/person-icon/image" alt="p1">
                        </div>
                        <div class="content">
                            <div class="poster_info">
                                <span class="name_id">${curr_resource.user.firstName}  ${curr_resource.user.lastName}</span>
                                <span class="topic"> ${curr_resource.topic.name}</span>
                            </div>
                            <div class="rating">
                                <div class="lft_half" style="justify-content: center;">
                                  <div class="userid" style="margin-top:1px ">  @${curr_resource.user.username}</div>
                                   <div  class="avg_rating">   Average Rating: ${avgRating}  </div>
                                </div>
                                <div class="rgt_half">
                                    <div class="date">${curr_resource.lastUpdated}</div>
   <g:if test="${session.user}">
    <div class="card star_rating">

        <span onclick="callMultipleFunctions(1)"
              class="star">★
        </span>
        <span onclick="callMultipleFunctions(2)"
              class="star">★
        </span>
        <span onclick="callMultipleFunctions(3)"
              class="star">★
        </span>
        <span onclick="callMultipleFunctions(4)"
              class="star">★
        </span>
        <span onclick="callMultipleFunctions(5)"
              class="star">★
        </span>
        <h3 id="output">
              Rating is: 0/5
          </h3>
    </div>
   </g:if>
                                </div>
                            </div>
                            <div class="post_content">Description:  ${curr_resource.description}
                            </div>
                            <g:if test="${session.user}">
                            <div class="poster_info">
                                <div class="clogo">
                                    <img src="${assetPath(src: 'facebook.svg')}" alt="facebook">
                                    <img src="${assetPath(src: 'twitter.svg')}" alt="twitter">
                                    <img src="${assetPath(src: 'instagram.svg')}" alt="instagram">
                                </div>
                                <div class="modal fade" id="exampleModalDeletepost${curr_resource.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Are you sure you want to delete Title?
                                            </div>
                                            <g:form controller="Post" action="delete_post" params="${[id:curr_resource.id]}">
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                    <button type="submit" class="btn btn-primary">Yes</button>
                                                </div>
                                            </g:form>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" class="btn" data-toggle="modal" data-target="#exampleModalDeletepost${curr_resource.id}" style="padding: 0; color: blue;">
                                    Delete  </button>
                                <button type="button" class="btn" data-toggle="modal" data-target="#exampleModalLinkRes" data-whatever="@getbootstrap" style="padding: 0; color: blue;" onclick="populateModal('${curr_resource.topic.name}','${curr_resource.id}')">  Edit  </button>
                                <a href="#">Download</a>
                                <a href="#">View full site</a>
                            </div>
                            </g:if>
                        </div>

                    </div>
                </div>
            

        </div>
        <div class="rightside mrgin">
            <div class="hSub">
                <p>Trending Topics</p>
                <a href="#" style="padding-top: 13px; padding-right: 12px;"> View All</a>
            </div>
                <g:each in="${all_Topics}"  var="topicData">
                    <g:if test="${topicData.isdeleted==null || !topicData.isdeleted}">

                        <div class="Border1" style="border: 2px solid black;">
                <div class="DSubcontent">
                    <div class="userCard" style="border: 0cap;">
                        <div class="userImg">
                            <%-- <img src="/Img/" alt="" height="90px" width="90px"> --%>
                            <img src="${assetPath(src: 'person-circle.svg')}" alt="instagram" height="90px" width="90px">

                        </div>
                        <div class="userData">
                            <h2>${topicData?.name}</h2>
                            <div class="userS">
                                <div class="DId">
                                    <p>${topicData?.user.username}</p>
                                    <g:if test="${curr_user?.id}">
                    <g:if test="${Subscription?.findByTopicAndUser(topicData,session.user)!=null}">
                                        <g:link controller="SubandUnsub" action="unsubscribe" params="[topicId: topicData.id, cuser: curr_user.id]">unsubscribe</g:link>
                                      </g:if>  
                                      <g:else>                                       
                                          <g:link controller="SubandUnsub" action="subscribe" params="[topicId: topicData.id, cuser: curr_user.id]">subscribe</g:link>
                                        </g:else>
                                    </g:if>
                                </div>
                                <div class="S">
                                    <p>Subscription</p>
                                    <p>${topicData?.subscriptions?.size()}</p>
                                </div>
                                <div class="T">
                                    <p>Topics</p>
                                    <p>${topicData?.resources?.size()}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="SubInfo">
                    <select id="dropdown-menu">
                        <option value="" disabled selected>Serious</option>
                        <option value="option1">Option 1</option>
                        <option value="option2">Option 2</option>
                        <option value="option3">Option 3</option>
                    </select>
                    <select id="dropdown-menu">
                        <option value="" disabled selected>Private</option>
                        <option value="option1">Option 1</option>
                        <option value="option2">Option 2</option>
                        <option value="option3">Option 3</option>
                    </select>
                   <img src="${assetPath(src: 'envelope.svg')}" alt="envelope" style="margin-left: 40px;">
                   <img src="${assetPath(src: 'link.svg')}" alt="link">
                   <img src="${assetPath(src: 'trash-fill.svg')}" alt="trash-fill">

                </div>
            </div>
                    </g:if>
                    </g:each>
        </div>
    </div>

</body>

<script>

function callMultipleFunctions(rating) {
    gfg(rating);
    rate(rating);
}


// script.js

// To access the stars
let stars = 
	document.getElementsByClassName("star");
let output = 
	document.getElementById("output");

// Funtion to update rating
function gfg(n) {
	remove();
	for (let i = 0; i < n; i++) {
		if (n == 1) cls = "one";
		else if (n == 2) cls = "two";
		else if (n == 3) cls = "three";
		else if (n == 4) cls = "four";
		else if (n == 5) cls = "five";
		stars[i].className = "star " + cls;
	}
	output.innerText = "Rating is: " + n + "/5";
}

// To remove the pre-applied styling
function remove() {
	let i = 0;
	while (i < 5) {
		stars[i].className = "star";
		i++;
	}
}

var rtng = ${post_rating};
if(rtng!=0){
    gfg(rtng);
}
function rate(rating) {
    // Make an AJAX POST request to the controller
    console.log("rating frontend:" + rating);

    $.ajax({
        url: '/report/post/save ',
        type: 'POST',
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        },
        data: { rating: rating, resId:${resId}},
        success: function(data) {
            // Handle successful response from the server
            console.log('Rating saved successfully:', data);
            $('#output').text('Rating is: ' + rating + '/5');
        },
        error: function(jqXHR, textStatus, errorThrown) {
            // Handle error
            console.error('Error saving rating:', errorThrown);
        }
    });
}


function populateModal(topic, res_id) {
    document.getElementById('topic_name').value = topic;
    document.getElementById('res_id').value = res_id;
}
</script>

</html>