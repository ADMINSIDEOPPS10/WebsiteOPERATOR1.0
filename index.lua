<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPERATOR1.0 | STATUS DISPATCH</title>
    <link rel="icon" type="image/png" href="https://i.imgur.com/h1pDjAx.png">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&family=VT323&display=swap');

        body {
            background: #0a0a0a;
            color: #e0e0e0;
            font-family: 'VT323', monospace;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 700px;
            margin: 40px auto;
            background: rgba(30,30,30,0.9);
            border: 3px solid #555;
            padding: 30px;
        }

        h1 {
            font-family: 'Press Start 2P', cursive;
            text-align: center;
            color: #ddd;
            margin-bottom: 30px;
            text-shadow: 0 0 10px #666;
        }

        textarea {
            width: 100%;
            height: 150px;
            background: #1a1a1a;
            border: 2px solid #666;
            color: #eee;
            font-family: 'VT323', monospace;
            font-size: 1.3rem;
            padding: 15px;
            resize: vertical;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 18px;
            font-family: 'Press Start 2P', cursive;
            font-size: 1.4rem;
            background: #1f1f1f;
            color: #ddd;
            border: 3px solid #777;
            cursor: pointer;
            transition: all 0.3s;
        }

        button:hover {
            background: #333;
            border-color: #aaa;
            box-shadow: 0 0 20px rgba(170,170,170,0.5);
        }

        .status {
            margin-top: 15px;
            text-align: center;
            font-size: 1.3rem;
        }

        .success { color: #00ff88; }
        .error { color: #ff4444; }
    </style>
</head>
<body>
    <div class="container">
        <h1>OPERATOR1.0<br>STATUS DISPATCH</h1>
        
        <p style="text-align:center; color:#aaa; margin-bottom:20px;">
            Send live status update to clan Discord
        </p>

        <textarea id="message" placeholder="Type your status update here..."></textarea>
        
        <button onclick="sendStatus()">SEND STATUS UPDATE</button>

        <div id="result" class="status"></div>
    </div>

    <script>
        async function sendStatus() {
            const messageInput = document.getElementById('message');
            const resultDiv = document.getElementById('result');
            const messageText = messageInput.value.trim();

            if (!messageText) {
                resultDiv.innerHTML = `<span class="error">Message cannot be empty.</span>`;
                return;
            }

            // ←←← PUT YOUR WEBHOOK URL HERE ↓↓↓
            const webhookURL = "https://discord.com/api/webhooks/1508489317914513520/3qkO5HGEjmkaFsMjqhZiwbfEiOQM0AtRHoVGn7Okad20k1DZra05J1t5ORg08oMp_SNY";

            if (webhookURL === "https://discord.com/api/webhooks/1508489317914513520/3qkO5HGEjmkaFsMjqhZiwbfEiOQM0AtRHoVGn7Okad20k1DZra05J1t5ORg08oMp_SNY") {
                resultDiv.innerHTML = `<span class="error">Please set your Webhook URL first!</span>`;
                return;
            }

            const payload = {
                username: "OPERATOR1.0 Command",
                avatar_url: "https://i.imgur.com/h1pDjAx.png",
                content: `**STATUS UPDATE**\n${messageText}`
            };

            try {
                const response = await fetch(webhookURL, {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(payload)
                });

                if (response.ok) {
                    resultDiv.innerHTML = `<span class="success">✅ Status successfully sent to Discord!</span>`;
                    messageInput.value = ""; // Clear input
                } else {
                    resultDiv.innerHTML = `<span class="error">Failed to send. Check webhook URL.</span>`;
                }
            } catch (error) {
                resultDiv.innerHTML = `<span class="error">Error: Could not reach Discord.</span>`;
            }
        }
    </script>
</body>
</html>
