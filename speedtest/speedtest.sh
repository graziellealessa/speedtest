#!/usr/bin/env bash
# _______________|  speed_test : ping, teste de download e teste de upload.
#
#        Modelo de Uso:  testVel [ip-host-a-ser-testado]
#
#    Dependencies:  ping
#                   iperf3
#
#  Autora: Grazielle Alessa
#  PPGI - UFRJ - Trabalho de Redes de Computadores I
#
# HOST=146.164.0.125
echo "Iniciando Testes"
echo "3Mb Upload Sequencial"
iperf3 -p 5500 -c 146.164.0.125 -n 3M > uploadMetricasSeq3M.txt
echo "3Mb Download Sequencial"
iperf3 -p 5500 -c 146.164.0.125 -n 3M -R > downloadMetricasSeq3M.txt
echo "3mb Upload Paralelo"
iperf3 -p 5500 -c 146.164.0.125 -n 3M -P 3 > uploadMetricasParalela1p3.txt
echo "3Mb Download Paralelo"
iperf3 -p 5500 -c 146.164.0.125 -n 3M -P 3 -R > downloadMetricasParalela1p3.txt
echo "Iniciando testes com 30Mb"
echo "30Mb Upload Sequencial"
iperf3 -p 5500 -c 146.164.0.125 -n 30M > uploadMetricasSeq30M.txt
echo "30Mb Download Sequencial"
iperf3 -p 5500 -c 146.164.0.125 -n 30M -R > downloadMetricasSeq30M.txt
echo "30Mb 10x3 Upload Paralelo"
iperf3 -p 5500 -c 146.164.0.125 -n 10M -P 3 > uploadMetricasParalela10p3.txt
echo "30Mb 10x3 Download Paralelo"
iperf3 -p 5500 -c 146.164.0.125 -n 10M -P 3 -R > downloadMetricasParalela10p3.txt
echo "Iniciando testes com 300Mb"
echo "300Mb Upload Sequencial"
iperf3 -p 5500 -c 146.164.0.125 -n 300M > uploadMetricasSeq300M.txt
echo "300Mb Download Sequencial"
iperf3 -p 5500 -c 146.164.0.125 -n 300M -R > downloadMetricasSeq300M.txt
echo "300Mb 10x3 Upload Paralelo"
iperf3 -p 5500 -c 146.164.0.125 -n 100M -P 3 > uploadMetricasParalela100p3.txt
echo "300Mb 10x3 Download Paralelo"
iperf3 -p 5500 -c 146.164.0.125 -n 100M -P 3 -R > downloadMetricasParalela100p3.txt
echo "Iniciando testes com Downloads Paralelos"
echo "Iniciando com 3 streams"
iperf3 -p 5500 -c 146.164.0.125 -n 3M -P 3 -R > downloadMetricasParalela3.txt
echo "Iniciando com 30 streams"
iperf3 -p 5500 -c 146.164.0.125 -n 30M -P 30 -R > downloadMetricasParalela30.txt
echo "Iniciando com 128 streams"
iperf3 -p 5500 -c 146.164.0.125 -n 128M -P 128 -R > downloadMetricasParalela128.txt
echo "Iniciando testes com Downloads Paralelos"
echo "Iniciando com 3 streams"
iperf3 -p 5500 -c 146.164.0.125 -n 3M -P 3 > uploadMetricasParalela3.txt
echo "Iniciando com 30 streams"
iperf3 -p 5500 -c 146.164.0.125 -n 30M -P 30 > uploadMetricasParalela30.txt
echo "Iniciando com 128 streams"
iperf3 -p 5500 -c 146.164.0.125 -n 128M -P 128 > uploadMetricasParalela128.txt
echo "Fim da bateria de testes".
