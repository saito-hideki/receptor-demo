# Building Receptor Demo Environment

1. git clone receptor-demo on each node
```
$ git clone https://github.com/saito-hideki/receptor-demo.git
```

2. specify your receptor node list as `RECEPTOR_NODES`
```
RECEPTOR_NODES="rp00 rp01 rp02 rp03 rp04 rp05 rp06"
```

3. generate ca and cert files under certs/ directory in first node(i.e. rp00)
```
$ ./bootstrap.sh
```

4. transfer cert/* files to each node

5. modify receptor configuration file ($HOSTNAME.conf) on each node

6. start-up receptor on each node
```
$ ./start-receptor.sh
```

## Install Receptor

You can follow the following steps to build receptor server and client packages:

```
$ sudo dnf groupinstall "Development Tools"
$ sudo dnf install golang python3
$ pip3 install --user jinja2-cli
$ git clone https://github.com/project-receptor/receptor.git
$ cd receptor
$ make rpms
$ ls rpmbuild/RPMS/noarch/
receptorctl-0.9.4-0.git.19.gca33ade.el8.noarch.rpm  receptor-python-worker-0.9.4-0.git.19.gca33ade.el8.noarch.rpm
$ ls rpmbuild/RPMS/x86_64/
receptor-0.9.4-0.git.19.gca33ade.el8.x86_64.rpm
```

Then, install receptor packages and upgrade the python click module to the latest version:

```
$ sudo dnf localinstall \
receptor-0.9.4-0.git.19.gca33ade.el8.x86_64.rpm \
receptor-python-worker-0.9.4-0.git.19.gca33ade.el8.noarch.rpm \
receptorctl-0.9.4-0.git.19.gca33ade.el8.noarch.rpm
$ pip3 install --upgrade --user click
```

*Note: RHEL8 officially provide python3-click package, however the version of this is old and receptorctl package needs the latest version click module. Therefore, you may need to upgrade click module after install receptorctl using by pip3.*


# References
- https://github.com/project-receptor/sample-configs
