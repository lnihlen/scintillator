#ifndef SRC_VULKAN_SWAP_CHAIN_HPP_
#define SRC_VULKAN_SWAP_CHAIN_HPP_

#include "vulkan/Vulkan.hpp"

#include <memory>
#include <vector>

namespace scin { namespace vk {

class Canvas;
class Device;
class ImageSet;
class Pipeline;
class Window;

class Swapchain {
public:
    Swapchain(std::shared_ptr<Device> device);
    ~Swapchain();

    /*! Creates the swapchain from the window surface.
     *
     * \param directRendering If true the swapchain will configure the swapchain images for rendering, if false it is
     *        assumed the rendering is happening in an offscreen framebuffer, and the swapchain images are configured
     *        for transfers.
     * \return True on success, false on error.
     */
    bool create(Window* window, bool directRendering);
    void destroy();

    VkSurfaceFormatKHR surfaceFormat() { return m_surfaceFormat; }
    VkExtent2D extent() { return m_extent; }
    uint32_t numberOfImages() const { return m_numberOfImages; }
    VkSwapchainKHR get() { return m_swapchain; }
    std::shared_ptr<Canvas> canvas() { return m_canvas; }
    std::shared_ptr<ImageSet> images() { return m_images; }

private:
    std::shared_ptr<Device> m_device;
    VkSurfaceFormatKHR m_surfaceFormat;
    VkExtent2D m_extent;
    uint32_t m_numberOfImages;
    VkSwapchainKHR m_swapchain;
    std::shared_ptr<ImageSet> m_images;
    std::shared_ptr<Canvas> m_canvas;
};

} // namespace vk

} // namespace scin

#endif // SRC_VULKAN_SWAP_CHAIN_HPP_