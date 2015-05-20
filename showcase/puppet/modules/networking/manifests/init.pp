class networking {
  host { 'haproxy.localhost.localdomain':
    ip           => '192.168.60.50',
    host_aliases => ['haproxy'],
  }

  host { 'timeservice1.localhost.localdomain':
    ip           => '192.168.60.60',
    host_aliases => ['timeservice1'],
  }

  host { 'timeservice2.localhost.localdomain':
    ip           => '192.168.60.70',
    host_aliases => ['timeservice2'],
  }

  host { 'consul.localhost.localdomain':
    ip           => '192.168.60.80',
    host_aliases => ['consul'],
  }


}