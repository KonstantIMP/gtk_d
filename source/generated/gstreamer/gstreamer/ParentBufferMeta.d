module gstreamer.ParentBufferMeta;

private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * The #GstParentBufferMeta is a #GstMeta which can be attached to a #GstBuffer
 * to hold a reference to another buffer that is only released when the child
 * #GstBuffer is released.
 * 
 * Typically, #GstParentBufferMeta is used when the child buffer is directly
 * using the #GstMemory of the parent buffer, and wants to prevent the parent
 * buffer from being returned to a buffer pool until the #GstMemory is available
 * for re-use.
 *
 * Since: 1.6
 */
public struct ParentBufferMeta
{

	/**
	 * Get the global #GstMetaInfo describing  the #GstParentBufferMeta meta.
	 *
	 * Returns: The #GstMetaInfo
	 *
	 * Since: 1.6
	 */
	public static GstMetaInfo* getInfo()
	{
		return gst_parent_buffer_meta_get_info();
	}

	/** */
	public static GType getType()
	{
		return gst_parent_buffer_meta_api_get_type();
	}
}
