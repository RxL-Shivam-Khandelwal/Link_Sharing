<%@ page import="first_grails.Subscription" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${assetPath(src: 'Login.css')}" type="text/css">
    <link rel="stylesheet" href="${assetPath(src: 'topic_show.css')}" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


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
                                <span class="name_id">Shivam Khandelwal | Email@gmail.com</span>
                                <span class="topic"> Grails</span>
                            </div>
                            <div class="rating">
                                <div class="lft_half" style="justify-content: center;">
                                  <div class="userid">  @abcd </div>
                                   <div  class="avg_rating">   Average Rating: ${avgRating}  </div>
                                </div>
                                <div class="rgt_half">
                                    <div class="date">2:45 PM 22 FEB 2014</div>
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
                                </div>
                            </div>
                            <div class="post_content">Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur
                                magni temporibus nulla mollitia fugit optio corporis repudiandae porro animi aliquid
                            </div>
                            <div class="poster_info">
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
                </div>
            

        </div>
        <div class="rightside mrgin">
            <div class="hSub">
                <p>Trending Topics</p>
                <a href="#" style="padding-top: 13px; padding-right: 12px;"> View All</a>
            </div>
                <g:each in="${all_Topics}"  var="topicData">
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



</script>

</html>