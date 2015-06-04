# Script for Demonstration of Consul's Features


Start Consul and the UI: 
    
    vagrant up consul webui
    
Show the UI in the browser via [http://localhost:8500/]()

Explain the UI

Start the HAProxy: 

    vagrant up haproxy

Show the UI

Start all other nodes:
    
    vagrant up timeservice1 timeservice2 timeservice3
    
Explain the changes in UI

Show the service configuration file used:

   vagrant ssh -c "less /etc/consul.d/service-ts.json" timeservice1


Call the timestamp provided by the timeservice: 
     
    curl -s http://localhost:10080/now/ | jq .

Say they should pay attention to the `origin` field

Run the same request in a loop:
         
    while sleep 1; do
        curl -s http://localhost:10080/now/ | jq .origin ; 
    done
   
How kill one of the nodes:

    vagrant halt -f timeservice1 

Show the UI

Start the killed node again

    vagrant up timeservice1
    
Explain the HAProxy configuration template

    vagrant ssh -c "less /etc/consul-template.d/haproxy.cfg.ctmpl" haproxy

Show the changes to the HAProxy configuration during changes in the cluster:

    vagrant ssh -c "watch -n 1 'cat /etc/haproxy/haproxy.cfg'" haproxy


