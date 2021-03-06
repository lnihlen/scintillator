#ifndef SRC_VULKAN_COMMAND_POOL_HPP_
#define SRC_VULKAN_COMMAND_POOL_HPP_

#include "vulkan/Vulkan.hpp"

#include <memory>
#include <vector>

namespace scin { namespace vk {

class CommandBuffer;
class Device;

class CommandPool {
public:
    CommandPool(std::shared_ptr<Device> device);
    ~CommandPool();

    bool create();

    /*! Destroy the CommandPool and all associated CommandBuffers.
     *
     *  \note This will invalidate all CommandBuffer objects that this CommandPool created.
     */
    void destroy();

    VkCommandPool get() { return m_commandPool; }

private:
    std::shared_ptr<Device> m_device;
    VkCommandPool m_commandPool;
};

} // namespace vk

} // namespace scin

#endif // SRC_VULKAN_COMMAND_POOL_HPP_
