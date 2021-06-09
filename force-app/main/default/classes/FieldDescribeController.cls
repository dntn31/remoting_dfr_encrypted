public with sharing class FieldDescribeController {
    @RemoteAction
    public static Set<String> getObjects() {
        return Schema.getGlobalDescribe().keySet();
    }

    @RemoteAction
    public static Set<String> getObjectFields(String objectName) {
        return Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap().keySet();
    }

    @RemoteAction
    public static Map<String, Schema.DescribeFieldResult> getFieldDescribe(String objectName, String fieldName) {
        return new Map<String, Schema.DescribeFieldResult>{objectName+'.'+fieldName  => Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap().get(fieldName).getDescribe()};
    }
}
