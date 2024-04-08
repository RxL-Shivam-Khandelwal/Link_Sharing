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
            <img src="/Img/chat-fill.svg" alt="" onclick="showCard(1)">
            <img src="/Img/envelope.svg" alt="" onclick="showCard(2)">
            <img src="/Img/link.svg" alt="" id="showCardImage" onclick="showCard(3)">
            <img src="/Img/file-earmark-fill.svg" alt="" onclick="showCard(4)">
        </div>
        <div class="dprofile">
            <img src="/Img/person-fill.svg" alt="" style="height: 30px; width: 30px; padding-top: 6px;">
            <div class="dropdown">
                <button class="dropbtn nbtn">Dropdown
                    <img src="/Img/caret-down-fill.svg" alt="">
                </button>
                <div class="dropdown-content">
                    <a href="#">Profile</a>
                    <a href="#">User</a>
                    <a href="#">Topic</a>
                    <a href="#">Post</a>
                    <a href="#">Logout</a>
                </div>
            </div>
        </div>
    </div>


    <div class="window">
        <div class="leftside">
            <div class="Dsubscription">
                <div class="hSub">
                    <p>Topics:  "Grails"</p>
                    <a href="#" style="padding-top: 13px; padding-right: 12px;"> View All</a>
                </div>
                <div class="Border1" style="border: 2px solid black;">
                    <div class="DSubcontent">
                        <div class="userCard" style="border: 0cap;">
                            <div class="userImg">
                                <img src="/Img/person-circle.svg" alt="" height="90px" width="90px">
                            </div>
                            <div class="userData">
                                <h2>Uday Pratap Singh</h2>
                                <div class="userS">
                                    <div class="DId">
                                        <p>@uday</p>
                                        <a href="#">Unsubscribed</a>
                                    </div>
                                    <div class="S">
                                        <p>Subscription</p>
                                        <p>50</p>
                                    </div>
                                    <div class="T">
                                        <p>Topics</p>
                                        <p>50</p>
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
                        <img src="/Img/envelope.svg" alt="" style="margin-left: 40px;">
                        <img src="/Img/link.svg" alt="">
                        <img src="/Img//trash-fill.svg" alt="">
                    </div>
                </div>
            </div>

            <div class="Dsubscription">
                <div class="hSub">
                    <p>Users: "Grails"</p>
                    <a href="#" style="padding-top: 13px; padding-right: 12px;"> View All</a>
                </div>
                <div class="Border1" style="border: 2px solid black;">
                    <div class="DSubcontent">
                        <div class="userCard" style="border: 0cap;">
                            <div class="userImg">
                                <img src="/Img/person-circle.svg" alt="" height="90px" width="90px">
                            </div>
                            <div class="userData">
                                <h2>Uday Pratap Singh</h2>
                                <div class="userS">
                                    <div class="DId">
                                        <p>@uday</p>
                                        <a href="#">Unsubscribed</a>
                                    </div>
                                    <div class="S">
                                        <p>Subscription</p>
                                        <p>50</p>
                                    </div>
                                    <div class="T">
                                        <p>Topics</p>
                                        <p>50</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="Border1" style="border: 2px solid black;">
                    <div class="DSubcontent">
                        <div class="userCard" style="border: 0cap;">
                            <div class="userImg">
                                <img src="/Img/person-circle.svg" alt="" height="90px" width="90px">
                            </div>
                            <div class="userData">
                                <h2>Uday Pratap Singh</h2>
                                <div class="userS">
                                    <div class="DId">
                                        <p>@uday</p>
                                        <a href="#">Unsubscribed</a>
                                    </div>
                                    <div class="S">
                                        <p>Subscription</p>
                                        <p>50</p>
                                    </div>
                                    <div class="T">
                                        <p>Topics</p>
                                        <p>50</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="rightside">

            <div class="topics">
                <div class="Recent_share">
                    <h5>Recent Share</h5>
                </div>
                <div class="card1">
                    <div class="image">
                        <img src="https://louisville.edu/enrollmentmanagement/images/person-icon/image" alt="p1">
                    </div>
                    <div class="content ">
                        <div class="poster_info mrgn">
                            <span class="name_id">Shivam Khandelwal | Email@gmail.com</span>
                            <span class="topic"> Grails</span>
                        </div>

                        <div class="post_content mrgn">Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur
                            magni temporibus nulla mollitia fugit optio corporis repudiandae porro animi aliquid
                        </div>
                        <div class="poster_info ">
                            <div class="clogo">
                                <img src="/Img/facebook.svg" alt="">
                                <img src="/Img/twitter.svg" alt="">
                                <img src="/Img/instagram.svg" alt="">
                            </div>
                            <a href="#">Delete</a>
                            <a href="#">Edit</a>
                            <a href="#">Download</a>
                            <a href="#">View full site</a>
                        </div>
                    </div>

                </div>
                <div class="card1">
                    <div class="image">
                        <img src="https://louisville.edu/enrollmentmanagement/images/person-icon/image" alt="p1">
                    </div>
                    <div class="content ">
                        <div class="poster_info mrgn">
                            <span class="name_id">Shivam Khandelwal | Email@gmail.com</span>
                            <span class="topic"> Grails</span>
                        </div>

                        <div class="post_content mrgn">Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur
                            magni temporibus nulla mollitia fugit optio corporis repudiandae porro animi aliquid
                        </div>
                        <div class="poster_info ">
                            <div class="clogo">
                                <img src="/Img/facebook.svg" alt="">
                                <img src="/Img/twitter.svg" alt="">
                                <img src="/Img/instagram.svg" alt="">
                            </div>
                            <a href="#">Delete</a>
                            <a href="#">Edit</a>
                            <a href="#">Download</a>
                            <a href="#">View full site</a>
                        </div>
                    </div>

                </div>               
            </div>


        </div>
    </div>

</body>

</html>