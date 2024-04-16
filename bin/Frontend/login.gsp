<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="${assetPath(src: 'Login.css')}" type="text/css">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>

    <div class="navbar">
        <div>
          <a href="#" class="nav-link"><h4>Link Sharing</h4></a>
        </div>
        <div class="search-container">
          <span class="search-icon">&#128269;</span>
          <input type="text" class="search-input" placeholder="Search...">
          <span class="close-icon">&#10005;</span>
        </div>
      </div>

      
    <div class="box">
        <div class="row">
            <div class="col-md-7 left">

                <div class="topics">
                    <div class="Recent_share">
                        <h4 style="padding: 4px;">Recent Share</h4>
                    </div>
                    <g:if test="${resource != null && !resource.empty}">
                        <g:each in="${resource}"  var ="res">
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
                    <g:else>
                        <p>No resource created</p>
                    </g:else>
                </div>
                <div class="topics">
                    <div class="top_topics">
                        <div style="display: flex; align-items: center;">
                            <h4 style="padding: 4px;">Top shares</h4>
                        </div>
                        <!-- Example single danger button -->
                        <div class="dropdown">
                            <button class="dropbtn">Dropdown</button>
                            <div class="dropdown-content">
                                <a href="#">Link 1</a>
                                <a href="#">Link 2</a>
                                <a href="#">Link 3</a>
                            </div>
                        </div>
                    </div>
<g:if test="${res_shares != null && !res_shares.empty}">
    <g:each in="${res_shares}"  var ="res">
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
                </div>
            </div>
            <div class="col-md-5 login-form-2">
                <div class="login-logo">
                    <!-- <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/> -->
                </div>
                <h2 class="Login_form">Login Form</h2>
                <g:form name="loginForm" controller="login" action="loginUser">
                <div class="form-group"  >
                    <input type="text" name="email" class="form-control" placeholder="Your Email *" value="" />
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Your Password *" value="" />
                </div>password
                <div class="form-group">
                    <input type="submit" class="btnSubmit" value="Login" />
                </div>
                <div class="form-group">
                    <a href="#" class="btnForgetPwd" value="Login">Forget Password?</a>
                    <h6>Don't have account?</h6>
                    <a href="Register.html">Register Now!!</a>
                </div>
                </g:form>
            </div>
        </div>
    </div>
</body>

</html>