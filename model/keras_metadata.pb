
�broot"_tf_keras_network*�b{"name": "model", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "class_name": "Functional", "config": {"name": "model", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_1"}, "name": "input_1", "inbound_nodes": []}, {"class_name": "Embedding", "config": {"name": "enc_embedding", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 8440, "output_dim": 100, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "name": "enc_embedding", "inbound_nodes": [[["input_1", 0, 0, {}]]]}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_2"}, "name": "input_2", "inbound_nodes": []}, {"class_name": "Bidirectional", "config": {"name": "encoder_lstm1", "trainable": true, "dtype": "float32", "layer": {"class_name": "LSTM", "config": {"name": "lstm", "trainable": true, "dtype": "float32", "return_sequences": false, "return_state": true, "go_backwards": false, "stateful": false, "unroll": false, "time_major": false, "units": 300, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 4}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 5}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 6}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.4, "recurrent_dropout": 0.0, "implementation": 2}}, "merge_mode": "concat"}, "name": "encoder_lstm1", "inbound_nodes": [[["enc_embedding", 0, 0, {}]]]}, {"class_name": "Embedding", "config": {"name": "dec_embedding", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 1989, "output_dim": 100, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "name": "dec_embedding", "inbound_nodes": [[["input_2", 0, 0, {}]]]}, {"class_name": "Concatenate", "config": {"name": "concatenate", "trainable": true, "dtype": "float32", "axis": -1}, "name": "concatenate", "inbound_nodes": [[["encoder_lstm1", 0, 1, {}], ["encoder_lstm1", 0, 3, {}]]]}, {"class_name": "Concatenate", "config": {"name": "concatenate_1", "trainable": true, "dtype": "float32", "axis": -1}, "name": "concatenate_1", "inbound_nodes": [[["encoder_lstm1", 0, 2, {}], ["encoder_lstm1", 0, 4, {}]]]}, {"class_name": "LSTM", "config": {"name": "lstm_1", "trainable": true, "dtype": "float32", "return_sequences": true, "return_state": true, "go_backwards": false, "stateful": false, "unroll": false, "time_major": false, "units": 600, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 14}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 15}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 16}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.4, "recurrent_dropout": 0.0, "implementation": 2}, "name": "lstm_1", "inbound_nodes": [[["dec_embedding", 0, 0, {}], ["concatenate", 0, 0, {}], ["concatenate_1", 0, 0, {}]]]}, {"class_name": "Attention", "config": {"name": "attention_layer", "trainable": true, "dtype": "float32", "causal": false, "dropout": 0.0, "use_scale": false}, "name": "attention_layer", "inbound_nodes": [[["lstm_1", 0, 0, {}], ["encoder_lstm1", 0, 0, {}]]]}, {"class_name": "Concatenate", "config": {"name": "concat_layer", "trainable": true, "dtype": "float32", "axis": -1}, "name": "concat_layer", "inbound_nodes": [[["lstm_1", 0, 0, {}], ["attention_layer", 0, 0, {}]]]}, {"class_name": "TimeDistributed", "config": {"name": "time_distributed", "trainable": true, "dtype": "float32", "layer": {"class_name": "Dense", "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 1989, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}}}, "name": "time_distributed", "inbound_nodes": [[["concat_layer", 0, 0, {}]]]}], "input_layers": [["input_1", 0, 0], ["input_2", 0, 0]], "output_layers": [["time_distributed", 0, 0]]}, "shared_object_id": 25, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, null]}, "ndim": 2, "max_ndim": null, "min_ndim": null, "axes": {}}}, {"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, null]}, "ndim": 2, "max_ndim": null, "min_ndim": null, "axes": {}}}], "build_input_shape": [{"class_name": "TensorShape", "items": [null, null]}, {"class_name": "TensorShape", "items": [null, null]}], "is_graph_network": true, "save_spec": [{"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, null]}, "float32", "input_1"]}, {"class_name": "TypeSpec", "type_spec": "tf.TensorSpec", "serialized": [{"class_name": "TensorShape", "items": [null, null]}, "float32", "input_2"]}], "keras_version": "2.5.0", "backend": "tensorflow", "model_config": {"class_name": "Functional", "config": {"name": "model", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_1"}, "name": "input_1", "inbound_nodes": [], "shared_object_id": 0}, {"class_name": "Embedding", "config": {"name": "enc_embedding", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 8440, "output_dim": 100, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}, "shared_object_id": 1}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "name": "enc_embedding", "inbound_nodes": [[["input_1", 0, 0, {}]]], "shared_object_id": 2}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_2"}, "name": "input_2", "inbound_nodes": [], "shared_object_id": 3}, {"class_name": "Bidirectional", "config": {"name": "encoder_lstm1", "trainable": true, "dtype": "float32", "layer": {"class_name": "LSTM", "config": {"name": "lstm", "trainable": true, "dtype": "float32", "return_sequences": false, "return_state": true, "go_backwards": false, "stateful": false, "unroll": false, "time_major": false, "units": 300, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 4}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 5}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 6}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.4, "recurrent_dropout": 0.0, "implementation": 2}, "shared_object_id": 8}, "merge_mode": "concat"}, "name": "encoder_lstm1", "inbound_nodes": [[["enc_embedding", 0, 0, {}]]], "shared_object_id": 9}, {"class_name": "Embedding", "config": {"name": "dec_embedding", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 1989, "output_dim": 100, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}, "shared_object_id": 10}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "name": "dec_embedding", "inbound_nodes": [[["input_2", 0, 0, {}]]], "shared_object_id": 11}, {"class_name": "Concatenate", "config": {"name": "concatenate", "trainable": true, "dtype": "float32", "axis": -1}, "name": "concatenate", "inbound_nodes": [[["encoder_lstm1", 0, 1, {}], ["encoder_lstm1", 0, 3, {}]]], "shared_object_id": 12}, {"class_name": "Concatenate", "config": {"name": "concatenate_1", "trainable": true, "dtype": "float32", "axis": -1}, "name": "concatenate_1", "inbound_nodes": [[["encoder_lstm1", 0, 2, {}], ["encoder_lstm1", 0, 4, {}]]], "shared_object_id": 13}, {"class_name": "LSTM", "config": {"name": "lstm_1", "trainable": true, "dtype": "float32", "return_sequences": true, "return_state": true, "go_backwards": false, "stateful": false, "unroll": false, "time_major": false, "units": 600, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 14}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 15}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 16}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.4, "recurrent_dropout": 0.0, "implementation": 2}, "name": "lstm_1", "inbound_nodes": [[["dec_embedding", 0, 0, {}], ["concatenate", 0, 0, {}], ["concatenate_1", 0, 0, {}]]], "shared_object_id": 18}, {"class_name": "Attention", "config": {"name": "attention_layer", "trainable": true, "dtype": "float32", "causal": false, "dropout": 0.0, "use_scale": false}, "name": "attention_layer", "inbound_nodes": [[["lstm_1", 0, 0, {}], ["encoder_lstm1", 0, 0, {}]]], "shared_object_id": 19}, {"class_name": "Concatenate", "config": {"name": "concat_layer", "trainable": true, "dtype": "float32", "axis": -1}, "name": "concat_layer", "inbound_nodes": [[["lstm_1", 0, 0, {}], ["attention_layer", 0, 0, {}]]], "shared_object_id": 20}, {"class_name": "TimeDistributed", "config": {"name": "time_distributed", "trainable": true, "dtype": "float32", "layer": {"class_name": "Dense", "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 1989, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 21}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 22}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 23}}, "name": "time_distributed", "inbound_nodes": [[["concat_layer", 0, 0, {}]]], "shared_object_id": 24}], "input_layers": [["input_1", 0, 0], ["input_2", 0, 0]], "output_layers": [["time_distributed", 0, 0]]}}, "training_config": {"loss": "sparse_categorical_crossentropy", "metrics": null, "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "RMSprop", "config": {"name": "RMSprop", "learning_rate": 0.0010000000474974513, "decay": 0.0, "rho": 0.8999999761581421, "momentum": 0.0, "epsilon": 1e-07, "centered": false}}}}2
�root.layer-0"_tf_keras_input_layer*�{"class_name": "InputLayer", "name": "input_1", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_1"}}2
�root.layer_with_weights-0"_tf_keras_layer*�{"name": "enc_embedding", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "stateful": false, "must_restore_from_config": false, "class_name": "Embedding", "config": {"name": "enc_embedding", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 8440, "output_dim": 100, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}, "shared_object_id": 1}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "inbound_nodes": [[["input_1", 0, 0, {}]]], "shared_object_id": 2, "build_input_shape": {"class_name": "TensorShape", "items": [null, null]}}2
�root.layer-2"_tf_keras_input_layer*�{"class_name": "InputLayer", "name": "input_2", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_2"}}2
�root.layer_with_weights-1"_tf_keras_layer*�{"name": "encoder_lstm1", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Bidirectional", "config": {"name": "encoder_lstm1", "trainable": true, "dtype": "float32", "layer": {"class_name": "LSTM", "config": {"name": "lstm", "trainable": true, "dtype": "float32", "return_sequences": false, "return_state": true, "go_backwards": false, "stateful": false, "unroll": false, "time_major": false, "units": 300, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 4}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 5}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 6}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.4, "recurrent_dropout": 0.0, "implementation": 2}, "shared_object_id": 8}, "merge_mode": "concat"}, "inbound_nodes": [[["enc_embedding", 0, 0, {}]]], "shared_object_id": 9, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}, "shared_object_id": 28}], "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 100]}}2
�root.layer_with_weights-2"_tf_keras_layer*�{"name": "dec_embedding", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "stateful": false, "must_restore_from_config": false, "class_name": "Embedding", "config": {"name": "dec_embedding", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 1989, "output_dim": 100, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}, "shared_object_id": 10}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "inbound_nodes": [[["input_2", 0, 0, {}]]], "shared_object_id": 11, "build_input_shape": {"class_name": "TensorShape", "items": [null, null]}}2
�root.layer-5"_tf_keras_layer*�{"name": "concatenate", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Concatenate", "config": {"name": "concatenate", "trainable": true, "dtype": "float32", "axis": -1}, "inbound_nodes": [[["encoder_lstm1", 0, 1, {}], ["encoder_lstm1", 0, 3, {}]]], "shared_object_id": 12, "build_input_shape": [{"class_name": "TensorShape", "items": [null, 300]}, {"class_name": "TensorShape", "items": [null, 300]}]}2
�root.layer-6"_tf_keras_layer*�{"name": "concatenate_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Concatenate", "config": {"name": "concatenate_1", "trainable": true, "dtype": "float32", "axis": -1}, "inbound_nodes": [[["encoder_lstm1", 0, 2, {}], ["encoder_lstm1", 0, 4, {}]]], "shared_object_id": 13, "build_input_shape": [{"class_name": "TensorShape", "items": [null, 300]}, {"class_name": "TensorShape", "items": [null, 300]}]}2
�
�	root.layer-8"_tf_keras_layer*�{"name": "attention_layer", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Attention", "config": {"name": "attention_layer", "trainable": true, "dtype": "float32", "causal": false, "dropout": 0.0, "use_scale": false}, "inbound_nodes": [[["lstm_1", 0, 0, {}], ["encoder_lstm1", 0, 0, {}]]], "shared_object_id": 19, "build_input_shape": [{"class_name": "TensorShape", "items": [null, null, 600]}, {"class_name": "TensorShape", "items": [null, 600]}]}2
�
root.layer-9"_tf_keras_layer*�{"name": "concat_layer", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Concatenate", "config": {"name": "concat_layer", "trainable": true, "dtype": "float32", "axis": -1}, "inbound_nodes": [[["lstm_1", 0, 0, {}], ["attention_layer", 0, 0, {}]]], "shared_object_id": 20, "build_input_shape": [{"class_name": "TensorShape", "items": [null, null, 600]}, {"class_name": "TensorShape", "items": [null, null, 600]}]}2
�	root.layer_with_weights-4"_tf_keras_layer*�	{"name": "time_distributed", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "TimeDistributed", "config": {"name": "time_distributed", "trainable": true, "dtype": "float32", "layer": {"class_name": "Dense", "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 1989, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 21}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 22}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 23}}, "inbound_nodes": [[["concat_layer", 0, 0, {}]]], "shared_object_id": 24, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, null, 1200]}, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}, "shared_object_id": 30}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null, 1200]}}2
�
'root.layer_with_weights-1.forward_layer"_tf_keras_rnn_layer*�
{"name": "forward_lstm", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "LSTM", "config": {"name": "forward_lstm", "trainable": true, "dtype": "float32", "return_sequences": false, "return_state": true, "go_backwards": false, "stateful": false, "unroll": false, "time_major": false, "units": 300, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 31}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 32}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 33}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.4, "recurrent_dropout": 0.0, "implementation": 2}, "shared_object_id": 35, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, null, 100]}, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}, "shared_object_id": 36}]}2
�
(root.layer_with_weights-1.backward_layer"_tf_keras_rnn_layer*�
{"name": "backward_lstm", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "LSTM", "config": {"name": "backward_lstm", "trainable": true, "dtype": "float32", "return_sequences": false, "return_state": true, "go_backwards": true, "stateful": false, "unroll": false, "time_major": false, "units": 300, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 37}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 38}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 39}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.4, "recurrent_dropout": 0.0, "implementation": 2}, "shared_object_id": 41, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, null, 100]}, "ndim": 3, "max_ndim": null, "min_ndim": null, "axes": {}}, "shared_object_id": 42}]}2
�*root.layer_with_weights-3.cell"_tf_keras_layer*�{"name": "lstm_cell_3", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "LSTMCell", "config": {"name": "lstm_cell_3", "trainable": true, "dtype": "float32", "units": 600, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 14}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 15}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 16}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.4, "recurrent_dropout": 0.0, "implementation": 2}, "shared_object_id": 17}2
�8root.layer_with_weights-4.layer"_tf_keras_layer*�{"name": "dense", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "Dense", "config": {"name": "dense", "trainable": true, "dtype": "float32", "units": 1989, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 21}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 22}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "shared_object_id": 23, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 1200}}, "shared_object_id": 43}}2
�W,root.layer_with_weights-1.forward_layer.cell"_tf_keras_layer*�{"name": "lstm_cell_1", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "LSTMCell", "config": {"name": "lstm_cell_1", "trainable": true, "dtype": "float32", "units": 300, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 31}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 32}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 33}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.4, "recurrent_dropout": 0.0, "implementation": 2}, "shared_object_id": 34}2
�]-root.layer_with_weights-1.backward_layer.cell"_tf_keras_layer*�{"name": "lstm_cell_2", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "class_name": "LSTMCell", "config": {"name": "lstm_cell_2", "trainable": true, "dtype": "float32", "units": 300, "activation": "tanh", "recurrent_activation": "sigmoid", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}, "shared_object_id": 37}, "recurrent_initializer": {"class_name": "Orthogonal", "config": {"gain": 1.0, "seed": null}, "shared_object_id": 38}, "bias_initializer": {"class_name": "Zeros", "config": {}, "shared_object_id": 39}, "unit_forget_bias": true, "kernel_regularizer": null, "recurrent_regularizer": null, "bias_regularizer": null, "kernel_constraint": null, "recurrent_constraint": null, "bias_constraint": null, "dropout": 0.4, "recurrent_dropout": 0.0, "implementation": 2}, "shared_object_id": 40}2
��root.keras_api.metrics.0"_tf_keras_metric*�{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}, "shared_object_id": 44}2