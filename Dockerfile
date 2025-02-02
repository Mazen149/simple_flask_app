FROM python:3.9-slim

WORKDIR /app

# COPY . .

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY app.py app.py

#Create a label on the image with the port number
EXPOSE 5000  


CMD [ "python3" ,"app.py" ]


# ------------------layer1       line1
# -------------------layer2      line7
# ------------------layer3       line9
#-------------------layer4       line10
#-------------------layer5       line16