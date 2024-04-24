
<%@ page import="first_grails.Resources" %>
<%@ page import="first_grails.Subscription" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="${assetPath(src: 'Login.css')}" type="text/css">
    <link rel="stylesheet" href="${assetPath(src: 'dash.css')}" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
<asset:javascript src="dashboard.js"/>
    <div class="navbar" style="justify-content: space-evenly;">
        <div>
            <g:link controller="register" action="dashboard">
                <h3>Link Sharing</h3>
            </g:link>>
        </div>
        <div class="search-container">
            <span class="search-icon">&#128269;</span>
            <input type="text" class="search-input" placeholder="Search...">
            <span class="close-icon">&#10005;</span>
        </div>
        <div class="clogo">
           <%-- <div class="logo-container" onmouseover="changeColor(this)"> <img src="${assetPath(src: 'chat-fill.svg')}" alt="chat-fill" onclick="showCard(1)"></div>
         <div class="logo-container" onmouseover="changeColor(this)">   <img src="${assetPath(src: 'envelope.svg')}" alt="envelope" onclick="showCard(2)">  </div>
          <div class="logo-container" onmouseover="changeColor(this)">  <img src="${assetPath(src: 'link.svg')}" alt="link" onclick="showCard(3)">  </div>
          <div class="logo-container" onmouseover="changeColor(this)">  <img src="${assetPath(src: 'file-earmark-fill.svg')}" alt="file-earmark-fill" onclick="showCard(4)">  </div> --%>
            <button type="button" class="btn "  data-toggle="modal" data-target="#exampleModalTopic" data-whatever="@mdo"><img src="${assetPath(src: 'chat-fill.svg')}" alt="chat-fill" ></button>
            <button type="button" class="btn " data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">  <img src="${assetPath(src: 'envelope.svg')}" alt="envelope" >
            </button>
            <button type="button" class="btn" data-toggle="modal" data-target="#exampleModalLinkR" data-whatever="@getbootstrap"> <img src="${assetPath(src: 'link.svg')}" alt="link">
            </button>
            <button type="button" class="btn" data-toggle="modal" data-target="#exampleModalDocumentR" data-whatever="@getbootstrap"> <img src="${assetPath(src: 'file-earmark-fill.svg')}" alt="file-earmark-fill"> 
            </button>  
             <div class="modal fade" id="exampleModalTopic" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create Topic</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
              <g:form controller="Topic" action="create_Topic"> 
                 <g:hiddenField name="userId" value="${session.userId}"/>  
                  <div class="modal-body"> 
                      <div class="form-group">
                        <label for="recipient-name" class="col-form-label"> Topic Name :</label>
                        <input type="text" class="form-control" id="recipient-name" name="name">
                      </div>
                      <div class="form-group">
                        <label for="message-text" class="col-form-label">Visibility:</label>
                          <select name="visibility" id="visibility" class="dropdown dropdownw">
                         <option value="Public">Public</option>
                         <option value="Private">Private</option>
                        </select>
                      </div>  
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary" type="submit">Send </button>
                  </div>
                   </g:form>
                </div>
              </div>
            </div>
     
            <div class="modal fade" id="exampleModalDocumentR" tabindex="-1" role="dialog" aria-labelledby="exampleModalDocumentR" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalDocumentR">Share Document</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
              <g:form controller="LinkResource" action="CreateLink"> 
                 <g:hiddenField name="userId" value="${session.userId}"/>  
                <div class="share_info"  >
                    <div class="share_link">
                        <label for="link">
                            <h5>Document*</h5>
                        </label>
                        <div class="browse_file" style="margin-left: 85px" >
                            <input type="file" id="fileInput" accept="image/*,.pdf,.doc,.docx,.txt" name="document"  size="35">
                        </div>
                    </div>
                    <div class="share_link">
                        <label for="Description">
                            <h5>Description* :</h5>
                        </label>
                        <textarea rows="3" cols="28">

                            </textarea>
                    </div>
                    <div class="share_link">
                        <label for="Topic">
                            <h5>Topic* :</h5>
                        </label>
                        <div class="dropdown dropdownw">
                            <button class="dropbtn dashDropdown">Linux
                                <img src="/Img/caret-down-fill.svg" alt="">
                            </button>
                            <div class="dropdown-content">
                                <a href="#">Grails</a>
                                <a href="#">Groovy</a>
                                <a href="#">Java</a>
                            </div>
                        </div>
                    </div>
                    <div class="pop_btn">
                        <button> Share</button>
                        <button id="cancelButton"> Cancel</button>
                    </div>
                </div>
                   </g:form>
                </div>
              </div>
            </div>
            <div class="modal fade" id="exampleModalLinkR" tabindex="-1" role="dialog" aria-labelledby="exampleModalLinkR" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLinkR">New message</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
              <g:form controller="LinkResource" action="CreateLink"> 
                 <g:hiddenField name="userId" value="${session.userId}"/>  
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
                        <input type="text" class="form-control" id="recipient-name" name="topic">
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
                     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
              <g:form controller="LinkResource" action="CreateLink"> 
                 <g:hiddenField name="userId" value="${session.userId}"/>  
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
                        <input type="text" class="form-control" id="recipient-name" name="topic">
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


    <div class="Dash">

        <div class="leftD">
            <div class="userCard">
                <div class="userImg">
                    <img src="${assetPath(src: 'person-circle.svg')}" alt="person-circle.svg"  height="90px" width="90px">
                </div>
                <div class="userData">
                    <h2 id="userName">Loading Name...</h2>
                    <p id="userEmail">Loading Email Id...</p>
                    <div class="userS">
                        <div class="S">
                            <p>Subscription</p>
                            <p>...${subscriptionCount}</p>
                        </div>
                        <div class="T">
                            <p>Topics</p>
                            <p>${topicCount}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Dsubscription">
                <div class="hSub">
                    <p>Subscription</p>
                    <a href="#" style="padding-top: 13px; padding-right: 12px;"> View All</a>
                </div>
                <g:render template="/templates/userSubscriptions" model="[subscription_Topic:subscription_Topic,curr_user: curr_user]" />



            </div>


            <div class="Dsubscription">
                <div class="hSub">
                    <p>Trending Topics</p>
                    <a href="#" style="padding-top: 13px; padding-right: 12px;"> View All</a>
                </div>
                <g:render template="/templates/trendingTopics" model="[all_Topics:all_Topics, currentPage: currentPage, totalRecords: totalRecords,maxPerPage: maxPerPage]" />
            </div>
        </div>
        <div class="rightD">
            <div class="topics" style="margin-top: -50px;">
                <div class="Recent_share">
                    <h4 style="padding: 4px;">Recent Share</h4>
                </div>
            <g:if test="${resource != null && !resource.empty}">
            <g:each in="${resource}"  var ="res">
%{--            <g:if test="${res.isRead ==false}">--}%
                <div class="card1 ">
                    <div class="image">
                        <img src="https://louisville.edu/enrollmentmanagement/images/person-icon/image" alt="p1">
                    </div>
                    <div class="content">
                        <div class="poster_info">
                            <span class="name_id">${res?.user?.username} |  ${res?.user?.email}</span>
                            <span class="topic"> ${res?.topic?.name}</span>
                        </div>
                        <div class="post_content">Description : ${res.description}
                        </div>
                        <div class="poster_info setting_margin">
                            <div class="clogo">
                                <a href="https://www.facebook.com/" target="_blank"><img src="${assetPath(src: 'facebook.svg')}" alt="facebook">
                                </a>
                                <a href="https://www.instagram.com/" target="_blank"><img src="${assetPath(src: 'instagram.svg')}" alt="instagram"></a>
                                 <a href="https://www.twitter.com/" target="_blank"><img src="${assetPath(src: 'twitter.svg')}" alt="twitter"></a>

                            </div>
                            <span class="topic">
                                <a href="#">Download</a>
                                <a href = "${createLink(absolute:true, uri:"${res.url}")}" target="_blank">View Full Site</a>
                                <g:link controller ="Register" action="is_read" params="[resId:res.id]"> Mark as read </g:link>
                                <g:link controller="Post" action="show" params="[resId: res.id]">View post</g:link>
                            </span>
                        </div>
                    </div>

                </div>
%{--                </g:if>--}%
            </g:each>
            </g:if>
            <g:else>
            <p>No resource created</p>
             </g:else>

            </div>
           



        </div>
    </div>

</body>

<script>
    // Check if userId is stored in localStorage
    var userId = localStorage.getItem('userId');
    console.log("helloWorld, userId is: " , userId);
    // AJAX request to fetch user details
    fetch('${createLink(controller: "User", action: "details")}?userId=' + userId)
        .then(response => response.json())
        .then(user => {
            // Update UI with user details
            console.log(user.username);
            console.log("user email id : ", user.email);
            document.getElementById('userName').textContent = user.username;
            document.getElementById('userEmail').textContent = user.email;
        })
        .catch(error => {
            console.error('Data is not extracted, Error:', error);
        });

  // change the div colour
// JavaScript function to change the background color of the parent div when the mouse hovers over the child image
function changeColor(element) {
    const logoContainers = document.querySelectorAll('.logo-container');
    
    logoContainers.forEach(container => {
        container.classList.remove('hovered'); // Remove the 'hovered' class from all logo containers
    });

    element.classList.add('hovered'); // Add 'hovered' class to the parent div of the hovered image
}

    document.addEventListener('DOMContentLoaded', function () {
        var textarea = document.querySelector('.share_link textarea');
        textarea.addEventListener('click', function () {
            // Set the cursor position to the beginning of the textarea
            textarea.selectionStart = textarea.selectionEnd = 0;
        });
    });

</script>
</html>