<!DOCTYPE html>
<html>
<head>
    <title>not approved</title>
    <style>
        /* Google Fonts import */
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@900&display=swap');

        /* Inline CSS styles */
        body {
            font-family: 'Montserrat', sans-serif;
            background: #F0FFFF;
            width: 100%;
            height: 100%;
            padding: 0;
            margin: 0;
            overflow-x: hidden;
        }

        #text {
            text-align: center;
            position: relative;
            top: 200px;
            font-size: 4em; /* Reduced font size to 4em */
        }

        .text0,
        .text2 {
            color: black;
            -webkit-text-fill-color: white;
            -webkit-text-stroke-width: 1px;
            -webkit-text-stroke-color: black;
        }

        .text1,
        .text3 {
            color: black;
            -webkit-text-fill-color: #bc0000;
            -webkit-text-stroke-width: 1px;
            -webkit-text-stroke-color: black;
        }

        #dummy {
            position: relative;
            height: 100vh;
            width: 100%;
        }

        #back {
            position: relative;
            padding-top: 50%;
            text-align: center;
            font-size: 1.5em;
            cursor: pointer;
        }

        @media only screen and (max-width: 600px) {
            #back {
                cursor: none;
                font-size: 0.8em;
            }
            #text {
                top: 70px;
                font-size: 2.25em;
            }
        }
        a{
display: block;
  color:grey;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  }
    </style>
</head>
<body>

    <div id="text" class="text0">we are sorry!</div>
    <div id="text" class="text1">we are sorry!</div>
    <div id="text" class="text2">we are sorry!</div>
    <div id="text" class="text3">we are sorry!</div>

    <div id="dummy">
        <div id="back">loan rejected.<br><br>
        we are currently unable to process your request.<br><br></div>
        <a href="home.jsp">Home</a>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.8.0/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.8.0/ScrollTrigger.min.js"></script>
    <script>
        // GSAP Animation code
        gsap.registerPlugin(ScrollTrigger);

        const animations = [
            { target: '.text0', x: '20%', rotate: 10, start: 'top 20%' },
            { target: '.text2', x: '20%', rotate: 10, start: 'top 40%' },
            { target: '.text1', x: '-20%', rotate: -10, start: 'top 30%' },
            { target: '.text3', x: '-20%', rotate: -10, start: 'top 40%' },
        ];

        animations.forEach((animation) => {
            gsap.to(animation.target, {
                x: animation.x,
                rotate: animation.rotate,
                duration: 0.85,
                scrollTrigger: {
                    trigger: animation.target,
                    scrub: true,
                    start: animation.start,
                },
            });
        });

        document.querySelector('#back').addEventListener('click', () => {
            gsap.to(window, { duration: 1, scrollTo: 'body' });
        });
    </script>

</body>
</html>
