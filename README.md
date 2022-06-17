# SSM Bulk set scripts

Dump all existing parameters like this:
```
./get-all-parameters.sh > my_ssm_parameters
```

The new file would contain:
```
SOME_PARAMETER=the-value
SOME_OTHER_PARAMETER=more values
```

Overwrite the value of all (existing!) parameters into SSM like this:
```
./set-parameters-from-stdin.sh < my_ssm_parameters
```

You need the `aws` cli v1 and `jq`.
