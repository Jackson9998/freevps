import discord
import torch
from transformers import GPT2Tokenizer, GPT2LMHeadModel

# Coloque o token do seu bot aqui
TOKEN = 'MTEyMjk4MTcyNTQ1NTI1MzU3NQ.Gzvdfb.pWuza2XZaJpp1Pj5I85lBmIuynVzUacxpU8NfY'
# ID do canal no qual o bot irá responder
ID_DO_CANAL = 1126290051609919499

# Inicializa o cliente do Discord com os intents necessários
intents = discord.Intents.default()
intents.message_content = True
client = discord.Client(intents=intents)

# Carrega o modelo GPT-2 pré-treinado e o tokenizador
tokenizer = GPT2Tokenizer.from_pretrained("gpt2")
model = GPT2LMHeadModel.from_pretrained("gpt2")

@client.event
async def on_ready():
    print(f'Bot conectado como {client.user}')

@client.event
async def on_message(message):
    # Verifica se a mensagem foi enviada em um canal específico
    if message.channel.id == ID_DO_CANAL:
        # Ignora as mensagens enviadas pelo próprio bot
        if message.author == client.user:
            return

        # Tokeniza a mensagem e gera a resposta do modelo
        input_text = message.content
        input_ids = tokenizer.encode(input_text, return_tensors="pt")
        with torch.no_grad():
            output = model.generate(input_ids, max_length=100, num_return_sequences=1)
        response = tokenizer.decode(output[0], skip_special_tokens=True)

        # Envia a resposta de volta para o canal
        await message.channel.send(response)

# Inicia o bot com o token fornecido
client.run(TOKEN)

