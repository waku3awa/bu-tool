from langchain_openai import ChatOpenAI
from browser_use import Agent
import asyncio
import datetime
from dotenv import load_dotenv


load_dotenv()

async def main(task):
    agent = Agent(
        task=task,
        llm=ChatOpenAI(model="gpt-4o"),
    )
    result = await agent.run()

    if result.is_done():
        dt_now = datetime.datetime.now()
        now_time = dt_now.strftime('%Y_%m_%d_%H_%M_%S')
        with open(f'output/{now_time}_{task}.md', 'w', encoding='utf-8') as f:
            f.write(f"## タスク: {task}\n")
            f.write("結果:<br>\n")
            f.write(result.final_result())


task = input("task? >")

asyncio.run(main(task))