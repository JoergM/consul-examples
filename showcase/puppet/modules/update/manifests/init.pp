class update {
  exec { 'APT Package Index Update':
    command => '/usr/bin/apt-get update',
    timeout => 600,
  }

  package { 'cUrl':
    name    => 'curl',
    ensure  => latest
  }

  package { 'Emacs without X11':
    name    => 'emacs23-nox',
    ensure  => latest
  }

  package { 'jq':
    name    => 'jq',
    ensure  => latest
  }

  Exec <| |> -> Package <| |>
}