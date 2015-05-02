class networking {
  host { 'ha.localhost.localdomain':
    ip           => '192.168.60.50',
    host_aliases => 'ha',
  }

  host { 'ts1.localhost.localdomain':
    ip           => '192.168.60.60',
    host_aliases => 'ts1',
  }

  host { 'ts2.localhost.localdomain':
    ip           => '192.168.60.70',
    host_aliases => 'ts2',
  }

  host { 'con.localhost.localdomain':
    ip           => '192.168.60.80',
    host_aliases => 'con',
  }


}