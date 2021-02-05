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

6. start-up receptor
```
$ ./start-receptor.sh
```

# References
- https://github.com/project-receptor/sample-configs
