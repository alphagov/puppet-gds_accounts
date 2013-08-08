# gds_accounts

Puppet wrapper module for managing GDS user accounts.

## Example usage

Include with default parameters:
```
include gds_accounts
```

Create some accounts from hiera:
``` yaml
---
gds_accounts::accounts:
  jane.smith:
    comment: Jane Smith
    ssh_key: XXX
  john.smith:
    comment: John Smith
    ssh_key: XXX
```

See class documentation for additional info.

## License

See [LICENSE](LICENSE) file.
