#!/bin/bash
# Script to compile protobufs.

compile()
{
  protoc -I=. --python_out=. plaso/proto/$1

  # Work-around for Python 3 incompatible code generated by protoc.
  sed 's/unicode("", "utf-8")/u""/g' -i plaso/proto/${1/.proto/}_pb2.py
}

compile plaso_storage.proto
