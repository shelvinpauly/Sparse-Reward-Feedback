# Sparse Reward Feedback - Deep Reinforcement Learning

This project explores improving deep reinforcement learning algorithms like LOGO and PPO in sparse reward environments. The goal is to learn optimal policies efficiently despite minimal reward signal.

## Approaches

- Implemented LOGO algorithm for sparse rewards using offline demonstration data
- Modified LOGO with PPO update steps instead of TRPO
- Integrated Clipped Double Q-Learning for value function to reduce overestimates
- Tuned PPO hyperparameters like clipping epsilon and KL penalty

## Environments

- Evaluated on MuJoCo locomotion tasks - Hopper, HalfCheetah, Walker2d, InvertedDoublePendulum
- Sparse reward given only on large position increments  

## Results

- Modified LOGO achieved improved performance over baseline LOGO in 3 out of 4 environments
- Reduced overestimates and faster policy convergence with CDQ in value function
- Lower clipping epsilon improved results in HalfCheetah, highlighting tuning challenges

## Discussion

- CDQ less beneficial in extremely sparse cases, can negatively impact performance
- PPO hyperparams may need tuning based on environment dynamics and sparsity level
- Future work can explore Bayesian optimization to find better rollouts and reduce steps

## Reference

[Li, Fucheng, Shelvin Pauly. "Deep Reinforcement Learning for Sparse Rewards." 2022](CMSC828A_Project_Report.pdf)
