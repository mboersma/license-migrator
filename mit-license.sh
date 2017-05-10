#!/bin/bash

projects="seed-repo"

for i in $projects; do
    git clone "https://github.com/$USER/$i"
    pushd "$i"
    git remote add upstream "https://github.com:deis/$i"
    git fetch --tags upstream master
    git merge upstream/master
    git checkout -b mit
    cat > LICENSE <<EOF
The MIT License (MIT)

Copyright (c) Microsoft Corporation. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
    git add LICENSE
    git commit -m "ref(LICENSE): switch to MIT license" -m "We are changing the project's license from Apache 2.0 to the MIT license. The MIT license is compatible not only with the Kubernetes and commercial community licensing communities, but also with the Linux and other copyleft licensed projects. MIT is also the most common OSS license on GitHub. Thanks for your continuing interest in our project."
    git push origin mit
    popd
done