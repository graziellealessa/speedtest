# Speedtest

Shell Script that make three avaluations about the connexion between 2 points:
- Ping
- Download Test (Sequential and Parallel)
- Upload Test (Sequential and Parallel)

### Prerequisites
- Iperf
```
sudo apt-get install iperf3
```
- Ping

### Goal
Generate metrics about Download, Upload and Latency. The script choose the fastest rate of download and upload and set the max capacity of bandwidth based on them.

### Example of Use
```
\.speedtest 127.0.0.1
```
