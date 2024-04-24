<%@  page import="first_grails.Users" %>
<%@ page import="first_grails.Subscription" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Topic Show</title>
    <link rel="stylesheet" href="${assetPath(src: 'Login.css')}" type="text/css">
    <link rel="stylesheet" href="${assetPath(src: 'topic_show.css')}" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
.hidden{
    display: none;
}
</style>
<body>
    <div class="navbar" style="justify-content: space-evenly;">
        <div>
            <g:link controller="register"  action="dashboard"> <h3>Link Sharing</h3>  </g:link>
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
            <img src="/Img/person-fill.svg" alt="" style="height: 30px; width: 30px; padding-top: 6px;">
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
        <div class="leftside">
            <div class="Dsubscription">
                <div class="hSub">
                    <p>Topics: "${topic_Show_Map?.curr_topic?.name}"</p>
                    <a href="#" style="padding-top: 13px; padding-right: 12px;"> View All</a>
                </div>
                <div class="Border1" style="border: 2px solid black;">
                    <g:set var="num" value="${1}" />
                    <div class="DSubcontent">
                        <div class="userCard" style="border: 0cap;">
                            <div class="userImg">
%{--                            <img src="${assetPath(src: 'person-circle.svg')}" alt="instagram" height="90px" width="90px">--}%
                                <img src=${user_img} height="90px" width="90px" alt="user_image">
                            </div>
                            <div class="userData">
                                <h2>${topic_Show_Map?.curr_topic?.name}</h2>
                                <g:form id="myFormS${num++}" name="myFormS${num++}"  class="hidden" controller="Register"  action="change_topic_name" >
                                    <g:hiddenField name="topicId" value="${topic_Show_Map.curr_topic.id}"/>
                                    <g:if test="${topic_Show_Map.curr_topic.user == topic_Show_Map.topic_owner }">
                                        <input type="text" placeholder="Enter New Topic Name" name="new_topic_name">
                                        <button type="submit" class="btn">Save</button>
                                        <button id="cancelBtn" type="button" class="btn" onclick="showFormS('myFormS${num - 1}')">Cancel</button>
                                    </g:if>
                                </g:form>
                                <div class="userS">
                                    <div class="DId">
                                        <p>@${topic_Show_Map?.topic_owner?.username}</p>
                                        <a href="#">Unsubscribe</a>
                                    </div>
                                    <div class="S">
                                        <p>Subscription</p>
                                        <p>${topic_Show_Map?.curr_topic?.subscriptions?.size()}</p>
                                    </div>
                                    <div class="T">
                                        <p>Posts</p>
                                        <p>${topic_Show_Map?.topic_posts?.size()}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="SubInfo">
                        <g:set var="Subscriber" value="${Subscription.findByUserAndTopic(topic_Show_Map.topic_owner,topic_Show_Map.curr_topic)}" />

                        <g:if test="${Subscriber  &&  topic_Show_Map.topic_owner == topic_Show_Map.curr_topic.user}">
                            <g:select id="seriournessSub_${topic_Show_Map.curr_topic.id}" from="['Serious', 'Casual','Very_serious']" name="selectedSeriousness"
                                      value="${Subscriber.seriousness}"
                                      onchange="sendSeriournessToController(this.value, ${Subscriber.id})"
                                      style="height: 30px; width: 140px;" />
                        </g:if>
                        <g:if test="${topic_Show_Map.curr_topic.user == topic_Show_Map.topic_owner}">
                            <g:select id="visiblitySub_${topic_Show_Map.curr_topic.id}" from="['Public', 'Private']" name="selectedVisibility"
                                      value="${topic_Show_Map.curr_topic.visibility}"
                                      onchange="sendDataToController(this.value, ${topic_Show_Map.curr_topic.id})"
                                      style="height: 30px; width: 140px;" />
                        </g:if>
                        <g:if test="${topic_Show_Map.curr_topic.user == topic_Show_Map.topic_owner }">
                            <img src="${assetPath(src: 'envelope.svg')}" alt="envelope" style="margin-left: 40px;">
                            <div class="modal fade" id="exampleModalDelete${topic_Show_Map.curr_topic.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                        <g:form controller="register" action="toDelete" params="${[id:topic_Show_Map.curr_topic.id]}">
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                <button type="submit" class="btn btn-primary">Yes</button>
                                            </div>
                                        </g:form>
                                    </div>
                                </div>
                            </div>
                            <button id="showFormBtn" type="button" class="btn" onclick="showFormS('myForm${num - 1}')" style="padding: 0px"> <img src="${assetPath(src: 'pencil-square.svg')}" alt="edit" >   </button>
                            <button type="button" class="btn" data-toggle="modal" data-target="#exampleModalDelete${topic_Show_Map.curr_topic.id}" style="padding: 0px">
                                <img src="${assetPath(src: 'trash-fill.svg')}" alt="trash-fill">    </button>
                        </g:if>

                    </div>
                </div>
            </div>

            <div class="Dsubscription">
                <div class="hSub">
                    <p>Users: "${topic_Show_Map?.curr_topic?.name}"</p>
                    <a href="#" style="padding-top: 13px; padding-right: 12px;"> View All</a>
                </div>
                <div id="subscribersListing"> 
<g:render template="/templates/subscribedUsers" model="[topic_Show_Map: topic_Show_Map, currentPage: currentPage, totalRecords: totalRecords, maxPerPage: maxPerPage]" />
                </div>
            </div>
        </div>

        <div class="rightside">

            <div class="topics">
                <div class="Recent_share">
                    <h5>Recent Share</h5>
                </div>
                <div id="23topicPosts">
                <g:render template="/templates/topicPosts" model="[topic_Show_MapP: topic_Show_Map, currentPageP: currentPage, totalRecords_Posts: totalRecords_Posts, maxPerPageP: maxPerPage]" />
                </div>
            </div>

        </div>
    </div>

</body>

</html>


<script>
    function showFormS(formName) {
        console.log("working" , formName);
        let form = document.forms[formName];
        if (form) {
            form.classList.toggle("hidden");
        } else {
            console.error("Form element with name '" + formName + "' not found.");
        }
    }

    function sendDataToController(selectedVisibility, topicId) {
        $.ajax({
            url: "${createLink(controller: 'Register', action: 'change_topic_mode')}",
            type: "POST",
            data: { selectedVisibility: selectedVisibility, topicId: topicId },
            success: function(response) {
                // Handle success response
                console.log(response);
            },
            error: function(xhr, status, error) {
                // Handle error
                console.error(error);
            }
        });
    }

    function sendSeriousnessToController(selectedSeriousness, StopicId) {
        $.ajax({
            url: "${createLink(controller: 'Register', action: 'change_seriousness')}",
            type: "POST",
            data: { selectedSeriousness: selectedSeriousness, StopicId: StopicId },
            success: function(response) {
                // Handle success response
                console.log(response);
            },
            error: function(xhr, status, error) {
                // Handle error
                console.error(error);
            }
        });
    }
</script>