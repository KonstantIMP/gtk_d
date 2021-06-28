module gdk.VulkanContext;

private import gdk.DrawContext;
private import gdk.c.functions;
public  import gdk.c.types;
private import gio.InitableIF;
private import gio.InitableT;
private import gobject.Signals;
private import std.algorithm;


/**
 * `GdkVulkanContext` is an object representing the platform-specific
 * Vulkan draw context.
 * 
 * `GdkVulkanContext`s are created for a surface using
 * [method@Gdk.Surface.create_vulkan_context], and the context will match
 * the the characteristics of the surface.
 * 
 * Support for `GdkVulkanContext` is platform-specific and context creation
 * can fail, returning %NULL context.
 */
public class VulkanContext : DrawContext, InitableIF
{
	/** the main Gtk struct */
	protected GdkVulkanContext* gdkVulkanContext;

	/** Get the main Gtk struct */
	public GdkVulkanContext* getVulkanContextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkVulkanContext;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkVulkanContext;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkVulkanContext* gdkVulkanContext, bool ownedRef = false)
	{
		this.gdkVulkanContext = gdkVulkanContext;
		super(cast(GdkDrawContext*)gdkVulkanContext, ownedRef);
	}

	// add the Initable capabilities
	mixin InitableT!(GdkVulkanContext);


	/** */
	public static GType getType()
	{
		return gdk_vulkan_context_get_type();
	}

	/**
	 * Emitted when the images managed by this context have changed.
	 *
	 * Usually this means that the swapchain had to be recreated,
	 * for example in response to a change of the surface size.
	 */
	gulong addOnImagesUpdated(void delegate(VulkanContext) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "images-updated", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
