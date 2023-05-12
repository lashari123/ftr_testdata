@IsTest
public class testBatch_DeleteBatch {

        static testMethod void Batch_DeleteBatch(){

        Test.StartTest();
            string CORN_EXP = '0 0 0 1 4 ?';
            Batch_DeleteBatch test1 = new Batch_DeleteBatch();
            string jobid = system.schedule('my batch job', CORN_EXP, new Batch_DeleteBatch() );
        }

    }