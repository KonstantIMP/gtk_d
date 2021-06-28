module gst.base.PushSrc;

private import gst.base.BaseSrc;
private import gst.base.c.functions;
public  import gst.base.c.types;


/**
 * This class is mostly useful for elements that cannot do
 * random access, or at least very slowly. The source usually
 * prefers to push out a fixed size buffer.
 * 
 * Subclasses usually operate in a format that is different from the
 * default GST_FORMAT_BYTES format of #GstBaseSrc.
 * 
 * Classes extending this base class will usually be scheduled
 * in a push based mode. If the peer accepts to operate without
 * offsets and within the limits of the allowed block size, this
 * class can operate in getrange based mode automatically. To make
 * this possible, the subclass should implement and override the
 * SCHEDULING query.
 * 
 * The subclass should extend the methods from the baseclass in
 * addition to the ::create method.
 * 
 * Seeking, flushing, scheduling and sync is all handled by this
 * base class.
 */
public class PushSrc : BaseSrc
{
	/** the main Gtk struct */
	protected GstPushSrc* gstPushSrc;

	/** Get the main Gtk struct */
	public GstPushSrc* getPushSrcStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstPushSrc;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gstPushSrc;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstPushSrc* gstPushSrc, bool ownedRef = false)
	{
		this.gstPushSrc = gstPushSrc;
		super(cast(GstBaseSrc*)gstPushSrc, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gst_push_src_get_type();
	}
}
