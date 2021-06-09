# remoting_dfr_encrypted

This is a POC JS Remoting sfdx app which demonstrates that Schema.DescribeFieldResult records returned via JS Remoting are missing the `encrypted` property which is accessible in APEX via the currently undocumented isEncrypted() method.

## Reproduction Steps:

1) Create a new scratch org: `sfdx force:org:create -s -f config/project-scratch-def.json -u scratch_remoting_dfr_encrypted`

2) Push all the source into the scratch org: `sfdx force:source:push`

3) Assign the permission set `Manage_Encryption`: `sfdx force:user:permset:assign -n Manage_Encryption`

4) Create a tenant secret: `sfdx force:data:record:create -s TenantSecret -v "Description=test"`

5) Open the file `force-app\main\default\objects\Account\fields\Name.field-meta.xml` and add a carriage return to mark the metadata as "dirty"

6) Push the updated `Account.Name field`: `sfdx force:source:push`

7) Open the `Encrypt Standard Fields Page`: `sfdx force:org:open -p _ui/com/salesforce/encryption/setup/EncryptStandardFieldsPage`

8) Confirm that the `Account.Name` has been encrypted (you should receive an email once this happens).

9) Run APEX tests: `sfdx force:apex:test:run`

10) Confirm all tests pass

11) Open the VF page `FieldDescribe`: `sfdx force:org:open -p apex/FieldDescribe`

12) Select Account.Name from the dropdowns and click `Get Field Describe`

13) Note that the `encrypted` property is not present in the results output

14) Repeat steps 12 and 13 for any other field