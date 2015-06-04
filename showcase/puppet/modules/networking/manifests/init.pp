class networking {
  host { 'haproxy-serv.localhost.localdomain':
    ip           => '192.168.60.50',
    host_aliases => ['haproxy-serv'],
  }

  host { 'timeservice-1-serv.localhost.localdomain':
    ip           => '192.168.60.60',
    host_aliases => ['timeservice-1-serv'],
  }

  host { 'timeservice-2-serv.localhost.localdomain':
    ip           => '192.168.60.70',
    host_aliases => ['timeservice-2-serv'],
  }

  host { 'timeservice-3-serv.localhost.localdomain':
    ip           => '192.168.60.100',
    host_aliases => ['timeservice-3-serv'],
  }

  host { 'consul-serv.localhost.localdomain':
    ip           => '192.168.60.80',
    host_aliases => ['consul-serv'],
  }


}