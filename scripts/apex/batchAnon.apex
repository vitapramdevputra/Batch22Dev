AccountUpdateBatch ab = new AccountUpdateBatch(); //new instance of batch class

Database.executeBatch(ab, 60);//it will divide record in 20 record chunks.
    //it will call start method of batch.
        //234 records
            //60
            //60
            //60

Id jobId = Database.executeBatch(ab, 60);

//Database.executeBatch(ab); //by default the size is 200.
    //it will call start method of batch.
        //500 records
            //200 -- execute method
            //200 -- execute method
            //100 -- execumte method
        //finish method