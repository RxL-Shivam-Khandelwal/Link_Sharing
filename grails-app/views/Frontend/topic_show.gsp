<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Topic Show</title>
    <link rel="stylesheet" href="${assetPath(src: 'Login.css')}" type="text/css">
    <link rel="stylesheet" href="${assetPath(src: 'topic_show.css')}" type="text/css">

</head>

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
                    <div class="DSubcontent">
                        <div class="userCard" style="border: 0cap;">
                            <div class="userImg">
                            <img src="${assetPath(src: 'person-circle.svg')}" alt="instagram" height="90px" width="90px">
                            </div>
                            <div class="userData">
                                <h2>${topic_Show_Map?.curr_topic?.name}</h2>
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
            </div>

            <div class="Dsubscription">
                <div class="hSub">
                    <p>Users: "${topic_Show_Map?.curr_topic?.name}"</p>
                    <a href="#" style="padding-top: 13px; padding-right: 12px;"> View All</a>
                </div>
            <g:if  test="${!topic_Show_Map.topic_subscribers.empty }">  
            <g:each in="${topic_Show_Map.topic_subscribers}" var="subscribers">
                <div class="Border1" style="border: 2px solid black;">
                    <div class="DSubcontent">
                        <div class="userCard" style="border: 0cap;">
                            <div class="userImg">
                            <img src="${assetPath(src: 'person-circle.svg')}" alt="instagram" height="90px" width="90px">
                            </div>
                            <div class="userData">
                                <h2>${subscribers?.user?.firstName}</h2>
                                <div class="userS">
                                    <div class="DId">
                                        <p>@${subscribers?.user?.username}</p>
                                        <a href="#">Unsubscribed</a>
                                    </div>
                                    <div class="S">
                                        <p>Subscription</p>
                                        <p>${subscribers?.user?.subscriptions?.size()}</p>
                                    </div>
                                    <div class="T">
                                        <p>Topics</p>
                                        <p>${subscribers?.user?.topics?.size()}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </g:each>
            </g:if>
            <g:else>
               <p> No user subscribed to the topic </p>
            </g:else>

            </div>
        </div>

        <div class="rightside">

            <div class="topics">
                <div class="Recent_share">
                    <h5>Recent Share</h5>
                </div>
                <g:if test="${!topic_Show_Map.topic_posts.empty }">
                <g:each in="${topic_Show_Map.topic_posts}" var="posts">
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
            </div>


        </div>
    </div>

</body>

</html>