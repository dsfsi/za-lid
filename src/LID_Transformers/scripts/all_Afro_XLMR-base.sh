for j in 1 2 3 4 5
do
	export MAX_LENGTH=200
	export BERT_MODEL=Davlan/afro-xlmr-base
	export OUTPUT_DIR=../../../../../../ext_data/neo/CTEXT_LID/afroxlmrbase_lid_vuk_nc
	export TEXT_RESULT=test_result$j.txt
	export TEXT_PREDICTION=test_predictions$j.txt
	export BATCH_SIZE=16
	export NUM_EPOCHS=10
	export SAVE_STEPS=10000
	export SEED=$j

	python3 ../LID_Transformers.py --data_dir ../CSV_Train_Test_Split_NCHLT_plus_Vuk/ \
	--model_type xlmroberta \
	--model_name_or_path $BERT_MODEL \
	--output_dir $OUTPUT_DIR \
	--max_seq_length  $MAX_LENGTH \
	--num_train_epochs $NUM_EPOCHS \
	--per_gpu_train_batch_size $BATCH_SIZE \
	--save_steps $SAVE_STEPS \
	--gradient_accumulation_steps 2 \
	--seed $SEED \
	--do_train \
	--do_eval \
	--do_predict \
	--overwrite_output_dir \
	--overwrite_cache \
	--lang mzanzi 
done



