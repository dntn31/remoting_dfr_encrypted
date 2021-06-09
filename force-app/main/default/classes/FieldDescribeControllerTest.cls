@isTest
public with sharing class FieldDescribeControllerTest {
    @isTest
    public static void assertDFRHasEncryptedPropertyFromRemotingResponseInAPEX() {
        Test.startTest();
        Map<String, Schema.DescribeFieldResult> remotingResult = FieldDescribeController.getFieldDescribe('account', 'name');
        Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(remotingResult.get('account.name')));
        Test.stopTest();
        
        System.assert(m.containsKey('encrypted'));
    }

    @isTest
    public static void getObjectsTest() {
        Test.startTest();
        Set<String> s = FieldDescribeController.getObjects();
        Test.stopTest();

        System.assert(s.contains('account'));
    }

    @isTest
    public static void getObjectFieldsTest() {
        Test.startTest();
        Set<String> s = FieldDescribeController.getObjectFields('account');
        Test.stopTest();

        System.assert(s.contains('name'));
    }
}
