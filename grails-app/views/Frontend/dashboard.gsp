
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
</head>

<body>
<asset:javascript src="dashboard.js"/>
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
<g:if test="${subscription_Topic}">

    <g:each in="${subscription_Topic}" var="StopicData">

        <div class="Border1" style="border: 2px solid black;">
            <div class="DSubcontent">
                <div class="userCard" style="border: 0cap;">
                    <div class="userImg">
                        <img src="${assetPath(src: 'person-circle.svg')}" alt="person-circle.svg" height="90px" width="90px">
                    </div>
                    <div class="userData">
                        <h2>${StopicData?.topic?.name}</h2>
                        <div class="userS">
                            <div class="DId">
                                <p>${StopicData?.topic?.user?.username}</p>
                                <a href="#">Unsubscribed</a>
                            </div>
                            <div class="S">
                                <p>Subscription</p>
                                <p>0</p>
                            </div>
                            <div class="T">
                                <p>Topic</p>
                                <p>0</p>
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
    </g:each>
</g:if>
<g:else>
    <p>No subscriptions</p>
</g:else>

            </div>


            <div class="Dsubscription">
                <div class="hSub">
                    <p>Trending Topics</p>
                    <a href="#" style="padding-top: 13px; padding-right: 12px;"> View All</a>
                </div>
                <g:if test="${all_Topics!= null}">
                <g:each in="${all_Topics}"  var="topicData">
                <div class="Border1" style="border: 2px solid black;">
                    <div class="DSubcontent">
                        <div class="userCard" style="border: 0cap;">
                            <div class="userImg">
                    <img src="${assetPath(src: 'person-circle.svg')}" alt="person-circle.svg"  height="90px" width="90px">
                            </div>
                            
                            <div class="userData">
                                <h2>${topicData?.name}</h2>
                                <div class="userS">
                                    <div class="DId">
                                     <p>  ${topicData?.user.username} </p>

                    <g:if test="${Subscription?.findByTopicAndUser(topicData,session.user)!=null}">
                                        <g:link controller="SubandUnsub" action="unsubscribe" params="[topicId: topicData.id, cuser: curr_user.id]">unsubscribe</g:link>
                                      </g:if>  
                                      <g:else>                                       
                                          <g:link controller="SubandUnsub" action="subscribe" params="[topicId: topicData.id, cuser: curr_user.id]">subscribe</g:link>
                                        </g:else> 
                                                
                                    </div>
                                    <div class="S">
                                        <p>Subscription</p>
                                        <p>${topicData?.subscriptions?.size()}</p>
                                    </div>
                                    <div class="T">
                                        <p>Post</p>
                                        <g:if test="${topicData != null}">
                                            <p>${topicData?.resources?.size()}</p>
                                            </g:if>
                                            <g:else>
                                            <p> 0 </p>
                                            </g:else>
                                        <%-- <p>${resources.where{topic==topicData}.count()}</p> --%>
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
                         <img src="${assetPath(src: 'link.svg')}" alt="link" >
                         <img src="${assetPath(src: 'trash-fill.svg')}" alt="trash-fill">
                    </div>
                </div>
                </g:each>
                </g:if>
                <g:else>
                   <p>No Trending Topic</p>
                   </g:else>

            </div>
        </div>
        <div class="rightD">
            <div class="topics" style="margin-top: -50px;">
                <div class="Recent_share">
                    <h4 style="padding: 4px;">Recent Share</h4>
                </div>
            <g:if test="${resource!=null}">
            <g:each in="${resource}"  var ="res">
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
                        <div class="poster_info">
                            <div class="clogo">
                                    <img src="${assetPath(src: 'facebook.svg')}" alt="facebook">
                                    <img src="${assetPath(src: 'twitter.svg')}" alt="twitter">
                                    <img src="${assetPath(src: 'instagram.svg')}" alt="instagram">
                            </div>
                            <span class="topic">
                                <a href="#">Download</a>
                                <a href="#">View Full Site</a>
                                <a href="#"> Mark as read</a>
                                <a href="#">View post</a>
                            </span>
                        </div>
                    </div>

                </div>
            </g:each>
            </g:if>
            <g:else>
            <p>No resource created</p>
                </g:else>

            </div>
           
            <div class="share_l pop_up " id="card1">
                <div class="share_heading">
                    <h3>Share Link</h3>
                </div>
                <g:form controller="LinkResource" action="CreateLink"> 
                 <g:hiddenField name="userId" value="${session.userId}"/>

                <div class="share_info"  >
                    <div class="share_link">
                        <label for="link">
                            <h5>Link* :</h5>
                        </label>
                        <input type="text" name="url" id="slink" size="45">
                    </div>
                    <div class="share_link">
                        <label for="Description">
                            <h5>Description* :</h5>
                        </label>
                        <textarea rows="7" cols="45" name=description>
                            </textarea>
                    </div>
                    <div class="share_link">
                        <label for="Topic">
                            <h5>Topic* :</h5>
                        </label>
                       <input type="text" name="topic" id="slink" size="45">
                    </div>
                    <div class="pop_btn">
                        <button type="submit"> Share</button>
                        <button id="cancelButton"> Cancel</button>
                    </div>
                </div>
                  </g:form>
            </div>

      
            <div class="share_l pop_up " id="card2">
                <div class="share_heading">
                    <h3>Share Document</h3>
                </div>
                <div class="share_info"  >
                    <div class="share_link">
                        <label for="link">
                            <h5>Document* :</h5>
                        </label>
                        <div class="browse_file">
                            <input type="file" id="fileInput" accept="image/*,.pdf,.doc,.docx,.txt" name="document"  size="35">
                            <!-- <button id="browseButton">Browse</button> -->
                        </div>
                    </div>
                    <div class="share_link">
                        <label for="Description">
                            <h5>Description* :</h5>
                        </label>
                        <textarea rows="7" cols="45">

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
            </div>
<g:form controller="Topic" action="create_Topic">
    <!-- Form content -->
    <div class="share_l pop_up" id="card3">
        <div class="share_heading">
            <h3>Create Topic</h3>
        </div>
        <div class="share_info">
            <div class="share_link">
                <label for="link">
                    <h5>Name* :</h5>
                </label>
                <g:textField name="name" id="slink" size="45"/>
            </div>
            <div class="share_link">
                <label for="Topic">
                    <h5>Visibility* :</h5>
                </label>
                         <select name="visibility" id="visibility" class="dropdown dropdownw">
                         <option value="Public">Public</option>
                         <option value="Private">Private</option>
                        </select>
            </div>
       <!-- Hidden input field to include user_id -->
            <g:hiddenField name="user" value="${session.user_id}"/>
            <div class="pop_btn">
                <g:submitButton name="save" class="saveButton" value="Save"/>
                <button type="button" id="cancelButton">Cancel</button>
            </div>
        </div>
    </div>
</g:form>

            <div class="share_l pop_up " id="card4">
                <div class="share_heading">
                    <h3>Send invitation</h3>
                </div>
                <div class="share_info"  >
                    <div class="share_link">
                        <label for="link">
                            <h5>Email* :</h5>
                        </label>
                        <input type="text" name="link" id="slink" size="45">
                    </div>
                    <div class="share_link">
                        <label for="Topic">
                            <h5>Topic* :</h5>
                        </label>
                        <div class="dropdown dropdownw">
                            <button class="dropbtn dashDropdown">Topic
                                <img src="/Img/caret-down-fill.svg" alt="">
                            </button>
                            <div class="dropdown-content">
                                <a href="#">Option 1</a>
                                <a href="#">Option 2</a>
                            </div>
                        </div>
                    </div>
                    <div class="pop_btn">
                        <button> Save</button>
                        <button id="cancelButton"> Cancel</button>
                    </div>
                </div>
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

</script>
</html>