# mosquitto websocket ブリッジサーバー

# dokcerのビルド
docker build ./ -t mosquitto

# dockerの起動
docker run -d -p 1883:1883 -p 8080:8080 mosquitto

# MQTTクライアントからpub/sub
mosquitto_pub -h localhost -p 1883 -d -t hello_topic -m "hello"

mosquitto_sub -h localhost -p 1883 -d -t hello_topic

# dockerの停止
docker stop 

