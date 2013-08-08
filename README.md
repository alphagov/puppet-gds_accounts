# gds_accounts

Puppet module for gds_accounts.

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

## License

See [LICENSE](LICENSE) file.
