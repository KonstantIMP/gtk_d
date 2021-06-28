module gsk.VulkanRenderer;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gsk.Renderer;
private import gsk.c.functions;
public  import gsk.c.types;


/**
 * A GSK renderer that is using Vulkan.
 */
public class VulkanRenderer : Renderer
{
	/** the main Gtk struct */
	protected GskVulkanRenderer* gskVulkanRenderer;

	/** Get the main Gtk struct */
	public GskVulkanRenderer* getVulkanRendererStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gskVulkanRenderer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gskVulkanRenderer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GskVulkanRenderer* gskVulkanRenderer, bool ownedRef = false)
	{
		this.gskVulkanRenderer = gskVulkanRenderer;
		super(cast(GskRenderer*)gskVulkanRenderer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gsk_vulkan_renderer_get_type();
	}

	/** */
	public this()
	{
		auto __p = gsk_vulkan_renderer_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GskVulkanRenderer*) __p, true);
	}
}
