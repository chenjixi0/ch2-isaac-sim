# ch2-isaac-sim

本仓库为教材第 2 章《搭建开发环境与机器人仿真平台》的配套材料，主要用于辅助完成 NVIDIA Isaac Sim 5.0.0 的环境检查、启动，以及 Action Graph 基础运动案例复现。

## 1. 环境

- Ubuntu 22.04 LTS
- NVIDIA Isaac Sim 5.0.0
- NVIDIA RTX GPU
- Linux x86_64

## 2. 文件说明

```text
ch2-isaac-sim/
├── README.md
├── check_environment.sh
└── launch_isaac_sim.sh
```

- `check_environment.sh`：检查 Ubuntu 版本、系统架构和 NVIDIA GPU/驱动状态。
- `launch_isaac_sim.sh`：进入 Isaac Sim 安装目录并启动 Application Selector。

## 3. 环境检查

为脚本添加执行权限：

```bash
chmod +x check_environment.sh
```

运行：

```bash
./check_environment.sh
```

正常情况下应能够看到：

- Ubuntu 22.04 LTS
- `x86_64`
- NVIDIA GPU 型号及驱动信息

## 4. 启动 Isaac Sim

默认假设 Isaac Sim 5.0.0 解压在：

```text
~/isaac-sim-standalone-5.0.0-linux-x86_64
```

为脚本添加执行权限：

```bash
chmod +x launch_isaac_sim.sh
```

运行：

```bash
./launch_isaac_sim.sh
```

脚本会进入 Isaac Sim 安装目录并执行：

```bash
./isaac-sim.selector.sh
```

在 Application Selector 中选择：

```text
Isaac-sim
```

然后单击 `START` 启动 Isaac Sim。

如果 Isaac Sim 安装目录与默认路径不同，可在运行脚本时传入实际目录，例如：

```bash
./launch_isaac_sim.sh ~/my_isaac_sim
```

## 5. Action Graph 基础运动案例

教材第 2.4 节使用 Isaac Sim 自带的 Mock Robot 双轮机器人完成基础关节速度控制。

在 Content Browser 中进入：

```text
Isaac Sim → Samples → Rigging → MockRobot
```

打开：

```text
mock_robot_rigged
```

创建 Joint Velocity Controller 时使用：

```text
Robot Prim:
/mock_robot

Graph Path:
mock_robot/Graphs/Velocity_Controller
```

在 `JointCommandArray` 中可以使用以下测试值：

```text
input0 = 5.0
input1 = 5.0
```

随后单击 Timeline 中的 `Play`，观察机器人运动。

> `5.0` 仅作为基础测试值。机器人实际运动方向与车轮关节轴的定义有关，如运动方向不符合预期，可调整 `input0` 和 `input1` 的正负号。

## 6. 说明

本仓库不包含 Isaac Sim 安装包、NVIDIA 官方 Assets 或其他大型资源文件。相关程序和资源应从 NVIDIA 官方渠道获取。
