#!/usr/bin/env bash 
# _______________|  speed_test : ping, teste de download e teste de upload. 
# 
#        Modelo de Uso:  testVel [ip-host-a-ser-testado] 
# 
#    Dependencies:  ping 
#                   iperf 
# 
#  Autores: Grazielle Alessa e Felipe Ribas
#  PPGI - UFRJ - Trabalho de Redes de Computadores I 
# 
HOST=$1 
echo "Rodando Testes"
echo "Upload Sequencial" 
iperf -c $HOST -n 3000M | grep -P "[^ ]*? [^ ]*?\/sec" | sed -r 's/.* ([^ ]*) ([GM])bits.*/\2\1/' > uploadMetricas.txt 
echo "3 Upload Paralelo" 
iperf -c $HOST -n 1000M -P 3 | grep -P "[^ ]*? [^ ]*?\/sec" | sed -r 's/.* ([^ ]*) ([GM])bits.*/\2\1/' >> uploadMetricas.txt 

seq=$(head -n 1 uploadMetricas.txt | sed 's/K/1/' | sed 's/M/2/' | sed 's/G/3/')
par=$(tail -n 1 uploadMetricas.txt | sed 's/K/1/' | sed 's/M/2/' | sed 's/G/3/')

echo "Upload:"
if [[ ${seq/.} > ${par/.} ]]; then head -n 1 uploadMetricas.txt | sed -r 's/(^.)(.*)/\2 \1bits\/sec/'; else tail -n 1 uploadMetricas.txt | sed -r 's/(^.)(.*)/\2 \1bits\/sec/'; fi

echo "Download Sequencial" 
iperf -c $HOST -n 3000M -R| grep -P "[^ ]*? [^ ]*?\/sec" | sed -r 's/.* ([^ ]*) ([GM])bits.*/\2\1/' > downloadMetricas.txt 
echo "53 Download Paralelo" 
iperf -c $HOST -n 1000M -P 3 -R| grep -P "[^ ]*? [^ ]*?\/sec" | sed -r 's/.* ([^ ]*) ([GM])bits.*/\2\1/'  >> downloadMetricas.txt 

seq=$(head -n 1 downloadMetricas.txt | sed 's/K/1/' | sed 's/M/2/' | sed 's/G/3/')
par=$(tail -n 1 downloadMetricas.txt | sed 's/K/1/' | sed 's/M/2/' | sed 's/G/3/')

echo "Download:"
if [[ ${seq/.} > ${par/.} ]]; then head -n 1 downloadMetricas.txt | sed -r 's/(^.)(.*)/\2 \1bits\/sec/'; else tail -n 1 downloadMetricas.txt | sed -r 's/(^.)(.*)/\2 \1bits\/sec/'; fi

echo "Ping" 
ping -w 3 $HOST | grep rtt | sed -r 's/.*= [^\/]*?\/([^\/]*).*/\1/' >pingMetrica.txt
cat pingMetrica.txt | sed -r 's/(.*)/\1ms/'
