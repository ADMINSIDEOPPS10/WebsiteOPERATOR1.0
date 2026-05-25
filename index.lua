<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OPERATOR1.0 | COMMAND PANEL</title>
    <link rel="icon" type="image/png" href="https://i.imgur.com/h1pDjAx.png">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Press+Start+2P&family=VT323&display=swap');

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            background: #0a0a0a;
            color: #e0e0e0;
            font-family: 'VT323', monospace;
            overflow: auto;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            background: rgba(25,25,25,0.95);
            border: 3px solid #555;
        }

        header {
            text-align: center;
            border-bottom: 3px solid #666;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }

        .title {
            font-family: 'Press Start 2P', cursive;
            font-size: 3.8rem;
            color: #ddd;
            text-shadow: 0 0 15px #666;
            letter-spacing: 6px;
        }

        .subtitle {
            color: #888;
            font-size: 1.6rem;
            letter-spacing: 3px;
        }

        .panel {
            background: #1a1a1a;
            border: 2px solid #555;
            padding: 25px;
            margin-bottom: 30px;
        }

        textarea {
            width: 100%;
            height: 140px;
            background: #111;
            border: 2px solid #666;
            color: #eee;
            font-family: 'VT323', monospace;
            font-size: 1.4rem;
            padding: 15px;
        }

        button {
            width: 100%;
            padding: 18px;
            margin-top: 15px;
            font-family: 'Press Start 2P', cursive;
            font-size: 1.35rem;
            background: #1f1f1f;
            color: #ddd;
            border: 3px solid #777;
            cursor: pointer;
            transition: all 0.3s;
        }

        button:hover {
            background: #333;
            border-color: #aaa;
            box-shadow: 0 0 25px rgba(170,170,170,0.4);
        }

        .status {
            margin-top: 15px;
            text-align: center;
            font-size: 1.4rem;
            min-height: 30px;
        }

        .success { color: #00ff88; }
        .error { color: #ff4444; }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="title">OPERATOR1.0</div>
            <div class="subtitle">COMMAND & CONTROL PANEL</div>
        </header>

        <div class="panel">
            <h2 style="color:#bbb; margin-bottom:15px;">DISCORD STATUS DISPATCH</h2>
            <textarea id="message" placeholder="Enter status message to broadcast..."></textarea>
            
            <button onclick="sendToDiscord()">TRANSMIT STATUS UPDATE</button>
            
            <div id="result" class="status"></div>
        </div>

        <div style="text-align:center; color:#666; font-size:1.2rem;">
            Authorized Personnel Only • Tier 1 Clearance Required
        </div>
    </div>

    <script>
        async function sendToDiscord() {
            const messageInput = document.getElementById('message');
            const resultDiv = document.getElementById('result');
            const text = messageInput.value.trim();

            if (!text) {
                resultDiv.innerHTML = `<span class="error">Message cannot be empty.</span>`;
                return;
            }

            // === PUT YOUR WEBHOOK URL HERE ===
            const webhookURL = "https://discord.com/api/webhooks/1508489317914513520/3qkO5HGEjmkaFsMjqhZiwbfEiOQM0AtRHoVGn7Okad20k1DZra05J1t5ORg08oMp_SNY";

            if (webhookURL.includes("https://discord.com/api/webhooks/1508489317914513520/3qkO5HGEjmkaFsMjqhZiwbfEiOQM0AtRHoVGn7Okad20k1DZra05J1t5ORg08oMp_SNY")) {
                resultDiv.innerHTML = `<span class="error">Please replace the webhook URL first!</span>`;
                return;
            }

            const payload = {
                username: "OPERATOR1.0 Command",
                avatar_url: "https://i.imgur.com/h1pDjAx.png",
                content: `**🔴 STATUS UPDATE**\n${text}`
            };

            try {
                const response = await fetch(webhookURL, {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(payload)
                });

                if (response.ok) {
                    resultDiv.innerHTML = `<span class="success">✅ TRANSMISSION SUCCESSFUL</span>`;
                    messageInput.value = "";
                } else {
                    resultDiv.innerHTML = `<span class="error">Transmission failed. Check webhook.</span>`;
                }
            } catch (e) {
                resultDiv.innerHTML = `<span class="error">Connection error. Try again.</span>`;
            }
        }
    </script>
</body>
</html>
