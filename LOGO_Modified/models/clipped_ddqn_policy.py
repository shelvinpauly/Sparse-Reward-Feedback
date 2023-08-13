import torch.nn as nn
import torch

class DQN(nn.Module):
    def __init__(self, state_dim, hidden_size=(128,128), activation='tanh'):
        super().__init__()
        if activation == 'tanh':
            self.activation = torch.tanh
        elif activation == 'relu':
            self.activation = torch.relu
        elif activation == 'sigmoid':
            self.activation = torch.sigmoid
        
        self.affine_layers = nn.ModuleList()
        last_dim = state_dim
        for nh in hidden_size:
            self.affine_layers.append(nn.Linear(last_dim, nh))
            last_dim = nh
        
        self.action_mean = nn.Linear(last_dim, action_dim)
        self.action_mean.weight.data.mul(0.1)
        self.action_mean.bias.data.mul(0)

        self.action_log_std = nn.Parameter(torch.ones(1, action_dim) * log_std)
    
    def forward(self, x):
        for affine in self.affine_layers:
            x = self.activation(affine(x))

        action_mean = self.action_mean(x)
        action_log_std = self.action_log_std.expand_as(action_mean)
        action_std = torch.exp(action_log_std)

        return action_mean, action_log_std, action_std
