# Environment Variables

The following environment variables must be set on the server for the Telegram order notifications to work.

## Required variables

| Variable | Description |
|---|---|
| `TELEGRAM_BOT_TOKEN` | Token provided by @BotFather when creating the bot |
| `TELEGRAM_CHAT_ID` | Telegram chat ID where order notifications are sent |

## How to get these values

**Bot token** — message [@BotFather](https://t.me/botfather) on Telegram:
```
/newbot
# follow prompts, copy the token it gives you
```

**Chat ID** — after creating the bot, send it any message, then open:
```
https://api.telegram.org/bot<TOKEN>/getUpdates
```
The `chat.id` field in the response is your chat ID. If using a group, add the bot to the group first.

## Setting the variables on the server (systemd)

Edit the service file:
```bash
sudo systemctl edit gonzacook
```

Add the following under `[Service]`:
```ini
[Service]
Environment="TELEGRAM_BOT_TOKEN=your_token_here"
Environment="TELEGRAM_CHAT_ID=your_chat_id_here"
```

Then reload and restart:
```bash
sudo systemctl daemon-reload
sudo systemctl restart gonzacook
```

## Verifying

To check that the variables are visible to the running service:
```bash
sudo systemctl show gonzacook --property=Environment
```

## Notes

- If these variables are not set, orders are still saved to `orders.json` but no Telegram message is sent.
- `orders.json` is created automatically in the project root on the first order.
