import asyncio
from aiogram import Bot, Dispatcher, F
from aiogram.types import Message, ReplyKeyboardMarkup, KeyboardButton
from .settings import settings
from .client import AstroClient

WELCOME = (
    "🌙 Добро пожаловать в астрологический бот SuperAstro AI Bot!\n\n"
    "Я помогу рассчитать натальную карту и дать интерпретации."
)

kb_start = ReplyKeyboardMarkup(
    keyboard=[[KeyboardButton(text="✨ Натальная карта")]],
    resize_keyboard=True
)

dp = Dispatcher()

@dp.message(F.text == "/start")
async def start(message: Message):
    await message.answer(WELCOME, reply_markup=kb_start)

@dp.message(F.text == "✨ Натальная карта")
async def demo(message: Message):
    client = AstroClient(settings.astroprocessor_base_url)
    payload = {
        "user_id": message.from_user.id,
        "birth": {
            "date": "30.10.1992",
            "time": None,
            "place_query": "Almaty, Kazakhstan",
            "gender": "male",
        },
        "topic_category": "personality_core",
        "locale": "ru-RU",
    }
    data = await client.interpret_stub(payload)
    await message.answer(data.get("text"))

async def main():
    bot = Bot(token=settings.bot_token)
    await dp.start_polling(bot)

if __name__ == "__main__":
    asyncio.run(main())
