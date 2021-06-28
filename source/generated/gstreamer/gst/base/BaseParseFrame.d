module gst.base.BaseParseFrame;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gst.base.c.functions;
public  import gst.base.c.types;
private import gstreamer.Buffer;
private import linker.loader;


/**
 * Frame (context) data passed to each frame parsing virtual methods.  In
 * addition to providing the data to be checked for a valid frame or an already
 * identified frame, it conveys additional metadata or control information
 * from and to the subclass w.r.t. the particular frame in question (rather
 * than global parameters).  Some of these may apply to each parsing stage, others
 * only to some a particular one.  These parameters are effectively zeroed at start
 * of each frame's processing, i.e. parsing virtual method invocation sequence.
 */
public class BaseParseFrame
{
	/** the main Gtk struct */
	protected GstBaseParseFrame* gstBaseParseFrame;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstBaseParseFrame* getBaseParseFrameStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstBaseParseFrame;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstBaseParseFrame;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstBaseParseFrame* gstBaseParseFrame, bool ownedRef = false)
	{
		this.gstBaseParseFrame = gstBaseParseFrame;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTBASE[0]) && ownedRef )
			gst_base_parse_frame_free(gstBaseParseFrame);
	}


	/** */
	public static GType getType()
	{
		return gst_base_parse_frame_get_type();
	}

	/**
	 * Allocates a new #GstBaseParseFrame. This function is mainly for bindings,
	 * elements written in C should usually allocate the frame on the stack and
	 * then use gst_base_parse_frame_init() to initialise it.
	 *
	 * Params:
	 *     buffer = a #GstBuffer
	 *     flags = the flags
	 *     overhead = number of bytes in this frame which should be counted as
	 *         metadata overhead, ie. not used to calculate the average bitrate.
	 *         Set to -1 to mark the entire frame as metadata. If in doubt, set to 0.
	 *
	 * Returns: a newly-allocated #GstBaseParseFrame. Free with
	 *     gst_base_parse_frame_free() when no longer needed.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Buffer buffer, GstBaseParseFrameFlags flags, int overhead)
	{
		auto __p = gst_base_parse_frame_new((buffer is null) ? null : buffer.getBufferStruct(), flags, overhead);

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GstBaseParseFrame*) __p);
	}

	/**
	 * Copies a #GstBaseParseFrame.
	 *
	 * Returns: A copy of @frame
	 *
	 * Since: 1.12.1
	 */
	public BaseParseFrame copy()
	{
		auto __p = gst_base_parse_frame_copy(gstBaseParseFrame);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(BaseParseFrame)(cast(GstBaseParseFrame*) __p, true);
	}

	/**
	 * Frees the provided @frame.
	 */
	public void free()
	{
		gst_base_parse_frame_free(gstBaseParseFrame);
		ownedRef = false;
	}

	/**
	 * Sets a #GstBaseParseFrame to initial state.  Currently this means
	 * all public fields are zero-ed and a private flag is set to make
	 * sure gst_base_parse_frame_free() only frees the contents but not
	 * the actual frame. Use this function to initialise a #GstBaseParseFrame
	 * allocated on the stack.
	 */
	public void init()
	{
		gst_base_parse_frame_init(gstBaseParseFrame);
	}
}
