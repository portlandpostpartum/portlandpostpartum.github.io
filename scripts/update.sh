#!/bin/bash

hugo
cd public
git add -A
git commit -S -sam "Updated $(date)"
git push -f
cd ..
