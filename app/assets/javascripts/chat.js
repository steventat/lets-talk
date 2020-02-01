class Chat {
    constructor() {
        this.channel = null;
        this.client = null;
        this.identity = null;
        this.messages = ["Connecting..."];
        this.initialize();
    }

    initialize() {
        this.renderMessages();

        Rails.ajax({
            url: "/tokens",
            type: "POST",
            success: data => {
                this.identity = data.identity;

                Twilio.Chat.Client
                    .create(data.token)
                    .then(client => this.setupClient(client));
            }
        });
    }

    joinChannel() {
        if (this.channel.state.status !== "joined") {
            this.channel.join().then(function(channel) {
                console.log("Joined General Channel");
            });
        }
    }

    setupChannel(channel) {
        this.channel = channel;
        this.joinChannel();
        this.addMessage({ body: `Joined general channel as ${this.identity}` });
    }

    setupClient(client) {
        this.client = client;
        this.client.getChannelByUniqueName("general")
            .then((channel) => this.setupChannel(channel))
            .catch((error) => {
                this.client.createChannel({
                    uniqueName: "general",
                    friendlyName: "General Chat Channel"
                }).then((channel) => this.setupChannel(channel));
            });
    }

    renderMessages() {
        let messageContainer = document.querySelector(".chat .messages");
        messageContainer.innerHTML = this.messages
            .map(message => `<div class="message">${message}</div>`)
            .join("");
    }

    addMessage(message) {
        let html = "";

        if (message.author) {
            const className = message.author == this.identity ? "user me" : "user";
            html += `<span class="${className}">${message.author}: </span>`;
        }

        html += message.body;
        this.messages.push(html);
        this.renderMessages();
    }
};