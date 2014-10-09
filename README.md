#Redmine User Indicator

Redmine plugin for indicate online/offline users

## Description

This plugin adds the ability to track which users are online or offline

## Installation

1. Stop redmine

2. Clone repository to your redmine/plugins directory
```
git clone git://github.com/itgalaxy-company/redmine-user-indicator.git
```

3. Run migration
```
rake redmine:plugins:migrate
```

4. Run redmine

7. (Optionally) Set idle timeout user.

## Uninstall

1. Stop redmine.

2. Rollback migration
```
rake redmine:plugins:migrate VERSION=0 NAME=redmine_sms_auth
```

3. Remove plugin directory from your redmine/plugins directory

## License

Copyright (c) 2009-2014 itgalaxy, inc.

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
