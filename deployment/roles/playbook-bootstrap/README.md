# Playbook bootstrap

Ansible Role to install required roles into local

.. code-block:: yaml

    - name: Basic host setup
      hosts: "deployer"
      max_fail_percentage: 20
      user: root
      roles:
        - { role: "playbook-bootstrap", tags: [ "basic-host-setup" ] }

Authors and License
-------

Written by:
* George Li | [e-Mail](GeorgeL1357@gmail.com) | [GitHub](https://github.com/GeorgeL1)

Licensed under the Apache License, Version 2.0 (the "License");

Copyright 2015, George Li from [Yongxin Solutions](www.yongxin.info)
