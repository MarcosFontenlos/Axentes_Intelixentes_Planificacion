#!/bin/bash
update_type="update_type:"
knowledge="knowledge:"

# REMOVE CONNECTION
update_type="$update_type
- 2";
knowledge="$knowledge
- knowledge_type: 1
  attribute_name: 'connected'
  values:
  - {key: '?from', value: 'wp10'}
  - {key: '?to', value: 'wp20'}"

echo $update_type
echo $knowledge

rosservice call /rosplan_knowledge_base/update_array "
$update_type
$knowledge";
